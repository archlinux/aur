#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=trapproto
pkgdesc="Trap extension headers"
pkgver=3.4.3
pkgrel=1
arch=('any')
url="http://www.x.org"
license=('custom')
depends=()
source=("http://xorg.freedesktop.org/releases/individual/proto/$pkgname-$pkgver.tar.bz2")
md5sums=('3b713239e5e6b269b31cb665563358df')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
