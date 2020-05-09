# Maintainer: Pietro Bonfa' <python-spglib@bnf.33mail.com>
pkgname=python-spglib
_pkgname=spglib
pkgver=1.11.2.1
pkgrel=1
pkgdesc="Python APIs for spglib, a C library for finding and handling crystal symmetries."
arch=('i686' 'x86_64')
url="atztogo.github.io/spglib/"
license=('custom')
groups=()
depends=(python-numpy spglib)
makedepends=()
checkdepends=()
optdepends=()
source=(https://github.com/atztogo/$_pkgname/archive/v$pkgver.tar.gz)
md5sums=('3089782bc85b5034dd4765a18ee70bc7')

build() {
    cd "$srcdir/$_pkgname-$pkgver/python"
    python setup.py build || return 1
}

package() {
    cd "$srcdir/$_pkgname-$pkgver/python"
    python setup.py install --root=$pkgdir/ --optimize=1 || return 1
}
