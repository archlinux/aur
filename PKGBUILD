# Maintainer: Alex Moening <alexandermoening@gmail.com>

pkgname=mpris-miniplayer
pkgver=1.2
pkgrel=1
pkgdesc='MPRIS Miniplayer'
arch=(x86_64)
url='https://git.dummkopf.live/InventorX/mpris-miniplayer'
license=(ZLIB)
depends=(playerctl raylib sdbus-cpp imgui curl)
source=("https://git.dummkopf.live/InventorX/mpris-miniplayer/archive/1.2.zip")
md5sums=('24d0ad9b2648a3e93a0436d29170c288')

build() {
  cd mpris-miniplayer
  make
  strip bin/main
}

package() {
  install -D mpris-miniplayer/bin/main "$pkgdir/usr/bin/mpris-miniplayer"
  install -D mpris-miniplayer/mpris-miniplayer.desktop "$pkgdir/usr/share/applications/mpris-miniplayer.desktop"
}
