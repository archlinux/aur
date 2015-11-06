# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=python-intelhex
_pkgname=${pkgname/python-/}
pkgver=2.0
pkgrel=1
pkgdesc="Python IntelHex library"
url="https://github.com/bialix/intelhex"
depends=('python' 'python-pip')
optdepends=()
license=('BSD')
arch=('any')
source=("https://github.com/bialix/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('770262fba1b032fdc3b4d2b50c239327b8f15286e089a218a48682f2b1b943a680a76b2a0813ee522babc21a8c6289db2244352ed0a5c442c3de55010765e04a')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
    rm -rf ${pkgdir}/usr/lib/python3.4/site-packages/tests/
}

