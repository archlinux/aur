# Maintainer: camtisocial <thompsonca99@gmail.com>
pkgname=pacfetch
pkgver=1.1.0
pkgrel=1
pkgdesc="A neofetch-style pacman stats display and -Syu wrapper"
arch=('x86_64')
url="https://github.com/camtisocial/pacfetch"
license=('GPL-3.0-or-later')
depends=('pacman')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/camtisocial/pacfetch/archive/v$pkgver.tar.gz")
sha256sums=('431f015938b203a334a7b321f5db4b4b9b799c2cd4627e138b6d2cbb0234d914')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/pacfetch" "$pkgdir/usr/bin/pacfetch"
}


