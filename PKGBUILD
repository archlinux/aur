# Maintainer: Pietro Bonfa' <python-spglib@bnf.33mail.com>
pkgname=python-spglib
_pkgname=spglib
pkgver=2.0.2
pkgrel=1
pkgdesc="Python APIs for spglib, a C library for finding and handling crystal symmetries."
arch=('i686' 'x86_64')
url="https://spglib.github.io/spglib"
license=('custom')
groups=()
depends=(python-numpy spglib)
makedepends=()
checkdepends=()
optdepends=()
source=(https://github.com/$_pkgname/$_pkgname/archive/v$pkgver.tar.gz)
md5sums=('021da5274ac27e5c97bfa64c5f34ebe0')


build() {
    cd "$srcdir/$_pkgname-$pkgver/python"
    python setup.py build || return 1
}

package() {
    cd "$srcdir/$_pkgname-$pkgver/python"
    python setup.py install --root=$pkgdir/ --optimize=1 || return 1
}
