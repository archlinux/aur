# Maintainer: Pietro Bonfa' <python-spglib@bnf.33mail.com>
pkgname=python-spglib
_pkgname=spglib
pkgver=1.10.1
pkgrel=1
pkgdesc="Python APIs for spglib, a C library for finding and handling crystal symmetries."
arch=('i686' 'x86_64')
url="http://atztogo.github.io/spglib/"
license=('custom')
groups=()
depends=(python-numpy spglib)
makedepends=()
checkdepends=()
optdepends=()
source=(https://github.com/atztogo/$_pkgname/archive/v$pkgver.tar.gz)
md5sums=('4034278f1df3e807c33407ba9f2d22ef')

build() {
    cd "$srcdir/$_pkgname-$pkgver/python"
    python setup.py build || return 1
}

package() {
    cd "$srcdir/$_pkgname-$pkgver/python"
    python setup.py install --root=$pkgdir/ --optimize=1 || return 1
}
