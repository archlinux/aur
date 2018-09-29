# Maintainer: Jianchen YANG <farseerfc@gmail.com>

pkgname=python-justbases
_pkgname=justbases
pkgver=0.09
pkgrel=1
pkgdesc="conversion of ints and rationals to any base"
url="https://github.com/mulkieran/justbases"
depends=('python')
checkdepends=('python-nose' 'python-hypothesis')
license=('GPL')
arch=('any')
source=("https://github.com/mulkieran/${_pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('d1843d3c672e199662e63a4dd189c809')

check() {
    cd $srcdir/${_pkgname}-$pkgver
    nosetests
}
build() {
    cd $srcdir/${_pkgname}-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/${_pkgname}-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
}
