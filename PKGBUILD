#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=xorg-xrx
_pkgname=xrx
pkgdesc="Broadway"
pkgver=1.0.4
pkgrel=2
arch=('x86_64' 'i686')
url="http://www.x.org/"
license=('custom')
depends=('libxaw')
makedepends=('xproxymngproto')
options=('!libtool')
source=("http://xorg.freedesktop.org/releases/individual/app/$_pkgname-$pkgver.tar.bz2")
md5sums=('c93be22d20658ac5ff60469207dec118')

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
