#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=xorg-xfindproxy
_pkgname=xfindproxy
pkgdesc="Locate X proxy services"
pkgver=1.0.2
pkgrel=1
arch=('x86_64' 'i686')
url="http://www.x.org/"
license=('custom')
depends=('libxt')
makedepends=('xproxymngproto')
source=("http://xorg.freedesktop.org/releases/individual/app/$_pkgname-$pkgver.tar.bz2")
md5sums=('2fa74c68511ae845f52c2f33e641d0fd')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc \
	--mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
