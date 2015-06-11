#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=xorg-xfwp
_pkgname=xfwp
pkgdesc="X firewall proxy"
pkgver=1.0.2
pkgrel=1
arch=('x86_64' 'i686')
url="http://www.x.org/"
license=('custom')
depends=('libice')
makedepends=('xproxymngproto')
source=("http://xorg.freedesktop.org/releases/individual/app/$_pkgname-$pkgver.tar.bz2")
md5sums=('eeb558aad30a8b2bc1f1f0e919ea6f38')

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
