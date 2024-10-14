# Maintainer: Kevin MacMartin <prurigro@gmail.com>

_pkgname=pocket-sync
pkgname=$_pkgname-bin
pkgver=5.2.0
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
sha512sums=('082a74b7a0d5a2c5f3ce54a7318b89842f3c4363c2f3273c0aa868eaed9e5cfeee5881c5d263bdfccce392d3be0b1a3b44181d2a3f9784a81adb9e853d07be4b')

prepare() {
  tar -zxvf data.tar.gz
  rename 'Pocket Sync' 'pocket-sync' 'usr/share/applications/Pocket Sync.desktop'
}

package() {
  mv usr "$pkgdir"
}
