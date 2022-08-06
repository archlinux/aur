#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=xorg-listres
_pkgname=listres
pkgdesc="List resources in widgets"
pkgver=1.0.5
pkgrel=1
arch=('x86_64' 'i686')
url="http://www.x.org/"
license=('custom')
depends=('libxaw')
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

md5sums=('966221006de8095d575517dfb0dad9cd')
