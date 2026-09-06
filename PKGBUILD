# Maintainer: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=diceware-eff
pkgver=0.2.0
pkgrel=2
pkgdesc="Generate passphrases from six-sided dice rolls"
arch=('any')
url="https://github.com/jmcantrell/$pkgname"
license=('MIT')
depends=()
makedepends=('scdoc')
checkdepends=('parallel' 'diffutils')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('40f659b3d207bdb10b215f3a9eed14c3d8489a1e917b145c0aa1a9df3b905088')

check() {
    cd "$srcdir/$pkgname-$pkgver" || return
    ./scripts/test
}

prepare() {
    cd "$srcdir/$pkgname-$pkgver" || return
    PREFIX=/usr ./scripts/prepare
}

build() {
    cd "$srcdir/$pkgname-$pkgver" || return
    ./scripts/build
}

package() {
    cd "$srcdir/$pkgname-$pkgver" || return
    DESTDIR=$pkgdir PREFIX=/usr ./scripts/install
}
