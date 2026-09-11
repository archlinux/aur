# Maintainer: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=diceware-eff
pkgver=0.3.1
pkgrel=1
pkgdesc="Generate passphrases from six-sided dice rolls"
arch=('any')
url="https://github.com/jmcantrell/$pkgname"
license=('MIT')
makedepends=('scdoc')
checkdepends=('bats-assert' 'bats-file')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0cf61e4be3480865a1feedce9cd5f7473b5617e26e1a94b725bec61a1fa09245')

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
