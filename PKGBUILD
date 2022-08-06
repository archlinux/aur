#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=xorg-proxymngr
_pkgname=proxymngr
pkgdesc="Proxy manager service"
pkgver=1.0.4
pkgrel=1
arch=('x86_64' 'i686')
url="http://www.x.org/"
license=('custom')
depends=('xorg-lbxproxy' 'libxt')
makedepends=('xproxymngproto')
source=("http://xorg.freedesktop.org/releases/individual/app/$_pkgname-$pkgver.tar.gz")

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

md5sums=('a165cf704f6a413f0bacf65ea470331f')
