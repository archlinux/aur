# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: xyzzy <628208@gmail.com>

pkgname=spotify-adblock-linux
pkgver=1.0
pkgrel=1
pkgdesc='Spotify adblocker for Linux'
arch=('x86_64')
url=https://github.com/abba23/spotify-adblock-linux
license=('GPL3')
depends=('spotify')
source=("$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz"
        "spotify-adblock.desktop")
sha512sums=('dae7c4b1ebbaa2e5e9f3545aab570242f2168877fbe64524fef3a6a305f2021195cf9db696a53902410c5fbdff2959d43cac667907405afa9c3da2afd6e4ec77'
            '69f497a0b869e855b7c6c733c73ee3f285000d56543bf5083382fe1957a9be9a27f8e7eff6e3ef5ccaf5c12ee7750c7e8561bef54e688e5b8b738b320f5cf90a')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm644 -t "$pkgdir"/usr/lib spotify-adblock.so
  install -Dm644 -t "$pkgdir"/usr/share/applications ../spotify-adblock.desktop
}
