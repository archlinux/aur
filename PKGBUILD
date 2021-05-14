# Maintainer: Jianchen YANG <farseerfc@gmail.com>

pkgname=python-justbases
_pkgname=justbases
pkgver=0.15
pkgrel=1
pkgdesc="conversion of ints and rationals to any base"
url="https://github.com/mulkieran/justbases"
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-hypothesis')
license=('GPL')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mulkieran/${_pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('2527651c3783b374e59fc137e653715e')

check() {
    cd "$srcdir/${_pkgname}-$pkgver"
    nosetests
}
build() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}
