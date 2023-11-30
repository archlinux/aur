# Maintainer: Stefan Mark <mark at unserver dot de>

pkgname=nxdisplaydaemon-git
_pkgname=nxdisplaydaemon
pkgver=0.99
pkgrel=1
pkgdesc="Backlight and screen locker daemon for NX"
url="https://git.weitnahbei.de/nullmark/nxdisplaydaemon"
arch=('i686' 'x86_64')
license=('MIT')
depends=('nxlib' 'nxhelper' )
#'nxsysdaemon')
optdepends=()
makedepends=('git')
provides=('nxdisplaydaemon')
conflicts=('nxdisplaydaemon')
source=("$_pkgname::git+http://git.weitnahbei.de/nullmark/nxdisplaydaemon")
sha256sums=('SKIP')

build() {
  cd $_pkgname
  #git submodule init
  #git submodule update
  make
}

package() {
  cd $_pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m644 -D README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
