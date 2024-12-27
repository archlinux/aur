# Maintainer: Alex Moening <alexandermoening@gmail.com>

pkgname=mpris-miniplayer
pkgver=1.0.2
pkgrel=1
pkgdesc='MPRIS Miniplayer'
arch=(x86_64)
url='https://git.dummkopf.live/InventorX/mpris-miniplayer'
license=(ZLIB)
depends=(raylib sdbus-cpp imgui curl)
source=("https://git.dummkopf.live/InventorX/mpris-miniplayer/archive/1.0.2.tar.gz")
md5sums=('24748ed6fe7a39022b940a0e14a1c2d2')

build() {
  cd mpris-miniplayer
  make
  strip bin/main
}

package() {
  install -D mpris-miniplayer/bin/main "$pkgdir/usr/bin/mpris-miniplayer"
  install -D mpris-miniplayer/mpris-miniplayer.desktop "$pkgdir/usr/share/applications/mpris-miniplayer.desktop"
}
