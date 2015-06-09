# Contributor: Jan Fader <jan.fader@web.de>
pkgname=plc
pkgver=0.1.8
pkgrel=2
pkgdesc="Tool for Devolo dLAN-Adapter"
url="http://slist.lilotux.net/linux/plc/index_en.html"
license=('GPL')
depends=(qt5-base libpcap)
makedepends=(qt5-tools)
arch=('i686' 'x86_64')
source=(http://slist.lilotux.net/linux/$pkgname/$pkgname-$pkgver.tgz)
sha512sums=('0876d77bebd5dfba7748a67d4b652c6e39f3e7163a10de8ac12f8f17ceb28fb312e1f0df2be8a0812061b6d8069deac81faad3c56f4c8f5cfd1585097d72e8e7')

build() {
  cd $srcdir/$pkgname-$pkgver
  qmake || return 1
  make || return 1
}
package() {
  cd $srcdir/$pkgname-$pkgver
  install -D plc $pkgdir/usr/bin/plc
}
