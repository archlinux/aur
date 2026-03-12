# Maintainer: camtisocial <thompsonca99@gmail.com>
pkgname=pacfetch
pkgver=1.1.3
pkgrel=1
pkgdesc="A neofetch-style pacman stats display and -Syu wrapper"
arch=('x86_64')
url="https://github.com/camtisocial/pacfetch"
license=('GPL-3.0-or-later')
depends=('pacman')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/camtisocial/pacfetch/archive/v$pkgver.tar.gz")
sha256sums=('1c5e8864f20256510126f0071a838d466fca89425a24e93d038e9f3f910676a2')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/pacfetch" "$pkgdir/usr/bin/pacfetch"
}


