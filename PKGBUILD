#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=xorg-xdbedizzy
_pkgname=xdbedizzy
pkgdesc="DBE sample"
pkgver=1.1.0
pkgrel=1
arch=('x86_64' 'i686')
url="http://www.x.org/"
license=('custom')
depends=('libxext')
source=("http://xorg.freedesktop.org/releases/individual/app/$_pkgname-$pkgver.tar.bz2")
md5sums=('7e730d15679490bd00a8b69e775b3487')

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
