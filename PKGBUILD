# Maintainer: Mia Evans <contact@nelyah.eu>

pkgname=python-prody
pkgver=1.10.10
pkgrel=2
pkgdesc='For protein structural dynamics analysis.'
arch=('any')
url='http://prody.csb.pitt.edu/'
license=('MIT')
# Only either one of the python version is required
depends=('python>=3.4' 'python2>=2.7' 'python-numpy>=1.10' 'python-biopython' 'python-scipy')
source=("https://github.com/prody/prody/archive/v${pkgver}.tar.gz")
md5sums=('2c862e4320b57a083072ec7f95ac4790')

prepare(){
    tar xzf v$pkgver.tar.gz
}

build() {
    cd ProDy-$pkgver
    python setup.py build
}

package(){
    cd $srcdir/ProDy-$pkgver
    python setup.py install --root=${pkgdir} --optimize=1
}
