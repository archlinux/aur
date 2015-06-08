# Contributor: Arthur Danskin <arthurdanskin@gmail.com>
# Maintainer:  Mike Ressler <mike.ressler@alum.mit.edu>

pkgname=python-pyfits
pkgver=3.3
pkgrel=1
pkgdesc="A python language interface to FITS formatted data files"
url="http://www.stsci.edu/resources/software_hardware/pyfits"
license=('BSD')
arch=('i686' 'x86_64')
source=("http://pypi.python.org/packages/source/p/pyfits/pyfits-$pkgver.tar.gz")
md5sums=('0d4f3515bc714f48093578e96ca7219d')

depends=('python>=3.1' 'python-numpy')

build() {
    cd "${srcdir}/pyfits-${pkgver}"
    python setup.py build 
}

package() {
    cd "${srcdir}/pyfits-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
    install -m755 -d "${pkgdir}/usr/share/licenses/python-pyfits"
    install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-pyfits/"
}

