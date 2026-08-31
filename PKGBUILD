# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: aquova

_pkgname=pocket-sync
pkgname=$_pkgname-bin
pkgver=6.4.0
pkgrel=1
pkgdesc='A GUI to do stuff with the Analogue Pocket'
url='https://github.com/neil-morrison44/pocket-sync'
license=('LGPL3')
arch=('x86_64')
depends=('fuse2' 'webkit2gtk-4.1' 'xdg-desktop-portal')
makedepends=('util-linux')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip')
source=("https://github.com/neil-morrison44/pocket-sync/releases/download/v${pkgver}/Pocket.Sync_${pkgver}_amd64.deb")
sha512sums=('898a040cf3f828a219420b3adc5e2ff7f42322e6aeb53cb3e75ee9d88a9bbeede75d1639719783c05c2be7aafe480e9e4510b1b6f104c3383cc0bcf14ec809ca')

prepare() {
  tar -zxvf data.tar.gz
  rename 'Pocket Sync' 'pocket-sync' 'usr/share/applications/Pocket Sync.desktop'
}

package() {
  mv usr "$pkgdir"
}
