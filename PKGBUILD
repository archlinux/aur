# Maintainer: Andrea Corsini <andrea dot corsini at outlook dot com>
pkgname=devour
pkgver=12
pkgrel=2
pkgdesc="Window Manager agnostic swallowing feature for terminal emulators"
arch=('x86_64')
url="https://github.com/salman-abedin/devour"
license=('GPL3')
depends=('libx11')
makedepends=('git')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::https://github.com/salman-abedin/devour/archive/$pkgver.tar.gz")
sha256sums=('5e9ddfee23d33557ba0b72affed6816d7b66ff06ef00aecdf0813b32f09b6eb4')

#prepare() {
#        cd "$srcdir/$pkgname-$pkgver"
#        patch -s < devour-shellalias-10.0.diff
#}

build() {
        cd "$srcdir/$pkgname-$pkgver"
        make all
}

package() {
        cd "$srcdir/$pkgname-$pkgver"
        make BIN_DIR="$pkgdir/usr/bin" install
}
