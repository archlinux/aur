# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=hexchat-indicator
pkgver=3
pkgrel=1
pkgdesc="Unity Application Indicator for HexChat (Bazaar version)"
arch=('i686' 'x86_64')
url="https://launchpad.net/hexchat-indicator/trunk"
license=('GPL')
depends=('indicator-messages' 'libunity')
makedepends=('bzr')
source=('hexchat-indicator::bzr+lp:hexchat-indicator')
sha512sums=('SKIP')

pkgver() {
  cd hexchat-indicator
  echo "$(bzr revno)"
}

build() {
  cd hexchat-indicator
  autoreconf -vfi
  ./configure --prefix=/usr
  make
}

package() {
  cd hexchat-indicator
  make DESTDIR="${pkgdir}/" install
}
