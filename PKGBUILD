#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=xproxymngproto
_pkgname=xproxymanagementprotocol
pkgdesc="Proxy manager headers"
pkgver=1.0.3
pkgrel=1
arch=('any')
url="http://www.x.org"
license=('custom')
depends=()
source=("http://xorg.freedesktop.org/releases/individual/proto/$_pkgname-$pkgver.tar.bz2")
md5sums=('9de22ca1522008c28fb03dfc41ba2d30')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
