# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: aquova

_pkgname=pocket-sync
pkgname=$_pkgname-bin
pkgver=7.2.0
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
sha512sums=('6ba1467ecc26f3b555c8d527594f7c5eead4df8f26ea7d1fa7df49158bb439c72f421386295d6125cbd919fe727543da94b72a0d45290f7d16082c56ecc06924')

prepare() {
  tar -zxvf data.tar.gz
  rename 'Pocket Sync' 'pocket-sync' 'usr/share/applications/Pocket Sync.desktop'
}

package() {
  mv usr "$pkgdir"
}
