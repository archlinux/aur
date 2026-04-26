# Maintainer: cursed <paradoxtools@proton.me>

pkgname=rain-ascii
pkgver=0.2.0
pkgrel=1
pkgdesc="Comfy ASCII rain for your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/cursssed/rain"
license=('MIT')
depends=('ncurses')
makedepends=('make' 'gcc')
conflicts=('rain')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('394d19f389b806e54bcd5396e38bf2ca69ba7122317fcb2f2a6dc9f5e0ea00f7')

build() {
    cd "rain-$pkgver"
    make
}

check() {
    cd "rain-$pkgver"
    make test
}

package() {
    cd "rain-$pkgver"

    install -Dm755 rain "$pkgdir/usr/bin/rain"
    install -Dm644 rain.conf.example "$pkgdir/usr/share/doc/$pkgname/rain.conf.example"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
