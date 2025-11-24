# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: aquova

_pkgname=pocket-sync
pkgname=$_pkgname-bin
pkgver=5.9.3
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
sha512sums=('c159557ed72208de1c5e37e4a987c34c9fbc8ff96872b462e62053c7601b45f258b9593a443b752f275156e15ae680f70e2cd3030f926cf3ab3bcb0d005642d0')

prepare() {
  tar -zxvf data.tar.gz
  rename 'Pocket Sync' 'pocket-sync' 'usr/share/applications/Pocket Sync.desktop'
}

package() {
  mv usr "$pkgdir"
}
