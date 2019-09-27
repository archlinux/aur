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
source=("$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('dae7c4b1ebbaa2e5e9f3545aab570242f2168877fbe64524fef3a6a305f2021195cf9db696a53902410c5fbdff2959d43cac667907405afa9c3da2afd6e4ec77')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm644 -t "$pkgdir"/usr/lib spotify-adblock.so
}
