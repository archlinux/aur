# Maintainer: camtisocial <thompsonca99@gmail.com>
pkgname=pacfetch
pkgver=1.0.0
pkgrel=1
pkgdesc="A neofetch-style pacman stats display and -Syu wrapper"
arch=('x86_64')
url="https://github.com/camtisocial/pacfetch"
license=('GPL-3.0-or-later')
depends=('pacman')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/camtisocial/pacfetch/archive/v$pkgver.tar.gz")
sha256sums=('b741259941687d00d01ef494493fb5e1a6fb474f3bd2daaa4f138d396abd9fb9')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/pacfetch" "$pkgdir/usr/bin/pacfetch"
}


