# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: aquova

_pkgname=pocket-sync
pkgname=$_pkgname-bin
pkgver=6.1.1
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
sha512sums=('e71f8c4385c1ff5492edffc510612d7c07ec3252a877484f340831e424bc529994ec9fd1fb21786da1e0415505141a480ece3a45c185de45cd5fada96bc9f306')

prepare() {
  tar -zxvf data.tar.gz
  rename 'Pocket Sync' 'pocket-sync' 'usr/share/applications/Pocket Sync.desktop'
}

package() {
  mv usr "$pkgdir"
}
