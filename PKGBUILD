#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=xorg-lbxproxy
_pkgname=lbxproxy
pkgdesc="Low bandwidth X proxy"
pkgver=1.0.3
pkgrel=1
arch=('x86_64' 'i686')
url="http://www.x.org/"
license=('custom')
depends=('liblbxutil' 'libice' 'libxext')
makedepends=('xproxymngproto' 'bigreqsproto')
source=("http://xorg.freedesktop.org/releases/individual/app/$_pkgname-$pkgver.tar.bz2")
md5sums=('0bd565b5464f38f606dae15459ff4b09')

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
