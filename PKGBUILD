# Maintainer: Mia Evans <contact@nelyah.eu>

pkgname=python-prody
pkgver=1.9.3
pkgrel=2
pkgdesc='For protein structural dynamics analysis.'
arch=('any')
url='http://prody.csb.pitt.edu/'
license=('MIT')
# Only either one of the python version is required
depends=('python>=3.4' 'python2>=2.7' 'python-numpy>=1.10')
source=("https://github.com/prody/prody/archive/v${pkgver}.tar.gz")
md5sums=('3e4e535b8a9c02aece3fe4ce22b79792')

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
