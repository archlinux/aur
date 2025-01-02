# Maintainer: Alex Moening <alexandermoening@gmail.com>

pkgname=mpris-miniplayer
pkgver=1.1
pkgrel=2
pkgdesc='MPRIS Miniplayer'
arch=(x86_64)
url='https://git.dummkopf.live/InventorX/mpris-miniplayer'
license=(ZLIB)
depends=(playerctl raylib sdbus-cpp imgui curl)
source=("https://git.dummkopf.live/InventorX/mpris-miniplayer/archive/1.1.zip")
md5sums=('264e95b21ae99b8f5b71276b4c1bb436')

build() {
  cd mpris-miniplayer
  make
  strip bin/main
}

package() {
  install -D mpris-miniplayer/bin/main "$pkgdir/usr/bin/mpris-miniplayer"
  install -D mpris-miniplayer/mpris-miniplayer.desktop "$pkgdir/usr/share/applications/mpris-miniplayer.desktop"
}
