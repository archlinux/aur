# Maintainer: Jianchen YANG <farseerfc@gmail.com>

pkgname=python-justbases
_pkgname=justbases
pkgver=0.14
pkgrel=3
pkgdesc="conversion of ints and rationals to any base"
url="https://github.com/mulkieran/justbases"
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-hypothesis')
license=('GPL')
arch=('any')
source=("https://github.com/mulkieran/${_pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('017a793c53fc7e2f6ad1d614e19e23e7')

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
