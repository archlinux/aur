# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: aquova

_pkgname=pocket-sync
pkgname=$_pkgname-bin
pkgver=7.2.1
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
sha512sums=('dae94db119d9da40b3455f7f71b1bc623052a7fc0fe88fb43cb20db8ffc30814be26b79c3ebdc30f3a02d387d40c3d9f6e0e53e879c3ae7842b83de68e29b784')

prepare() {
  tar -zxvf data.tar.gz
  rename 'Pocket Sync' 'pocket-sync' 'usr/share/applications/Pocket Sync.desktop'
}

package() {
  mv usr "$pkgdir"
}
