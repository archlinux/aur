# Maintainer: Andrea Corsini <andrea dot corsini at outlook dot com>
pkgname=devour
pkgver=11.0
pkgrel=1
pkgdesc="Window Manager agnostic swallowing feature for terminal emulators"
arch=('x86_64')
url="https://github.com/salman-abedin/devour"
license=('GPL3')
depends=('libx11')
makedepends=('git')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::https://github.com/salman-abedin/devour/archive/v$pkgver.tar.gz")
sha256sums=('e537c614cdf3e7376db1a94f1665d1d27f128d4927f4a0d1cce26ed8b910a217')

prepare() {
        cd "$srcdir/$pkgname-$pkgver"
        patch < devour-shellalias-10.0.diff
}

build() {
        cd "$srcdir/$pkgname-$pkgver"
        make all
}

package() {
        cd "$srcdir/$pkgname-$pkgver"
        make BIN_DIR="$pkgdir/usr/local/bin" install
}
