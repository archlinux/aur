# Maintainer: Simón Oroño <sron611@gmail.com>

pkgname='iop-blockchain'
pkgver=1.0.2b
pkgrel=1
pkgbase="$pkgname"
pkgdesc="IoP is the  digital currency from the Internet of People that enables instant payments to anyone, anywhere in the world."
arch=('i686' 'x86_64')
url="http://www.fermat.org/"
makedepends=('git' 'boost' 'libevent' 'qt5-base' 'qt5-tools' 'qrencode' 'protobuf' 'zeromq')
depends=(boost-libs desktop-file-utils libevent qt5-base qrencode protobuf zeromq)
license=('MIT')
source=(https://github.com/Fermat-ORG/iop-blockchain/archive/beta-1.0.0.zip)
sha256sums=('SKIP')

build() {
  cd "$pkgbase-beta-1.0.0"
  ./autogen.sh
  ./configure --prefix=/usr --with-gui=qt5 --with-incompatible-bdb
  make
}

package() {
  cd "$pkgbase-beta-1.0.0"
  install -Dm755 src/qt/IoP-qt "$pkgdir"/usr/bin/IoP-qt

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

