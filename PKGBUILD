# Maintainer: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=diceware-eff
pkgver=0.2.3
pkgrel=1
pkgdesc="Generate passphrases from six-sided dice rolls"
arch=('any')
url="https://github.com/jmcantrell/$pkgname"
license=('MIT')
makedepends=('scdoc')
checkdepends=('parallel' 'diffutils')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('db56f3d613dd8fcebb672b765bd391bdece5de4fa4c9297f4d249c102691a7ea')

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
