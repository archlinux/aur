# Maintainer: Kevin MacMartin <prurigro@gmail.com>

_pkgname=pocket-sync
pkgname=$_pkgname-bin
pkgver=5.5.0
pkgrel=1
pkgdesc='A GUI to do stuff with the Analogue Pocket'
url='https://github.com/neil-morrison44/pocket-sync'
license=('LGPL3')
arch=('x86_64')
depends=('fuse2' 'xdg-desktop-portal')
makedepends=('util-linux')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip')
source=("https://github.com/neil-morrison44/pocket-sync/releases/download/v${pkgver}/Pocket.Sync_${pkgver}_amd64.deb")
sha512sums=('32da2747a1a8b488c54efa0e3d6cfa224e64559484fd6ee315966369dcfd8e50a9363bdeb5f7577330fb0002d60a458b090cf213fb81151714b2e25742e36e72')

prepare() {
  tar -zxvf data.tar.gz
  rename 'Pocket Sync' 'pocket-sync' 'usr/share/applications/Pocket Sync.desktop'
}

package() {
  mv usr "$pkgdir"
}
