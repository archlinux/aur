# Maintainer: camtisocial <thompsonca99@gmail.com>
pkgname=pacfetch
pkgver=1.1.2
pkgrel=1
pkgdesc="A neofetch-style pacman stats display and -Syu wrapper"
arch=('x86_64')
url="https://github.com/camtisocial/pacfetch"
license=('GPL-3.0-or-later')
depends=('pacman')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/camtisocial/pacfetch/archive/v$pkgver.tar.gz")
sha256sums=('19fd3ada0850d33d3b274edeb77a451d84bda62e7bbc5a867fee92d7eabb2a50')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/pacfetch" "$pkgdir/usr/bin/pacfetch"
}


