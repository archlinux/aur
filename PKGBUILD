# Maintainer: Pietro Bonfa' <python-spglib@bnf.33mail.com>
pkgname=python-spglib
_pkgname=spglib
pkgver=1.9.9
pkgrel=1
pkgdesc="Python APIs for spglib, a C library for finding and handling crystal symmetries."
arch=('i686' 'x86_64')
url="http://http://atztogo.github.io/spglib/"
license=('custom')
groups=()
depends=(python-numpy spglib)
makedepends=()
checkdepends=()
optdepends=()
source=(https://github.com/atztogo/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('6bbf2cb37a2294f26f2324e1142ab7d8')

build() {
    cd "$srcdir/$_pkgname-$pkgver/python"
    python setup.py build || return 1
}

package() {
    cd "$srcdir/$_pkgname-$pkgver/python"
    python setup.py install --root=$pkgdir/ --optimize=1 || return 1
}
