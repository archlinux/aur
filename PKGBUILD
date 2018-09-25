# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=google-play-music-desktop-player
pkgdesc='Unofficial standalone Google Play Music player'
pkgver=4.6.1
pkgrel=1
arch=('x86_64')
url='https://www.googleplaymusicdesktopplayer.com/'
license=('MIT')
source=("https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-/releases/download/v$pkgver/$pkgname-$pkgver.x86_64.rpm")
sha512sums=('b313b51e96378daeeb10ee2d0fa45d50c6825179e1e6fe56cdeecdcb3d7625be135bf151dd7b73f9dd564ec4fbe594ac1fbc65c9d5c2dcb0475e1c959443b09e')

package() {
  rm -rf usr/share/doc

  # Install license files
  install -Dm644 usr/share/$pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 usr/share/$pkgname/LICENSES.chromium.html "$pkgdir"/usr/share/licenses/$pkgname/LICENSES.chromium.html

  cd "$srcdir"
  cp -r usr "$pkgdir"
  rm "$pkgdir"/usr/share/$pkgname/LICENSE*
}
