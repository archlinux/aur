# Maintainer : Andres Urquijo <alfagalileox@gmail.com>
pkgname=xmds
pkgver=2.2.3
pkgrel=1
pkgdesc="software package that allows the fast 
        and easy solution of sets of ordinary, partial and stochastic differential equations, 
        using a variety of efficient numerical algorithms"
arch=('i686' 'x86_64')
url="http://www.${pkgname}.org/index.html"
license=('GPL2')
depends=('python2' 'hdf5' 'fftw' 'gsl' 'python2-numpy' 
        'python2-lxml' 'python2-h5py' 'python2-mpmath' 
        'python2-markdown' 'python2-cheetah' 'python2-pyparsing')
optdepends=('openmp')
source=("https://sourceforge.net/projects/${pkgname}/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('ab913b2983e922a36dd8c9b5bb401ba9')

build(){
    cd "${srcdir}/${pkgname}-${pkgver}"
    python2 setup.py build
}

package(){
    cd "${srcdir}/${pkgname}-${pkgver}"
    python2 setup.py install --prefix=/usr  --root="$pkgdir"
}
