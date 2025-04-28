# Maintainer: Kevin MacMartin <prurigro@gmail.com>

_pkgname=pocket-sync
pkgname=$_pkgname-bin
pkgver=5.7.0
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
sha512sums=('a82cc4fb140a3f815efeeb7ecb5876da45a5cf150ba7c6fb2c8a5e8cef477997a6b9e53e0d59df699cba7334d68f5e91f25d3cf9faa6263027f868ead938c054')

prepare() {
  tar -zxvf data.tar.gz
  rename 'Pocket Sync' 'pocket-sync' 'usr/share/applications/Pocket Sync.desktop'
}

package() {
  mv usr "$pkgdir"
}
