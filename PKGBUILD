# Maintainer: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=diceware-eff
pkgver=0.4.0
pkgrel=1
pkgdesc="Generate passphrases from six-sided dice rolls"
arch=('any')
url="https://github.com/jmcantrell/$pkgname"
license=('MIT')
makedepends=('scdoc')
checkdepends=('bats-assert' 'bats-file')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d0b6956c66e7292a0222dee0e0b830dd86c82068d2a036c2d98248b2c7ab8042')

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
