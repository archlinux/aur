#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=liblbxutil
_pkgname=liblbxutil
pkgdesc="LBX utility routines"
pkgver=1.1.0
pkgrel=1
arch=('x86_64' 'i686')
url="http://www.x.org/"
license=('custom')
depends=('zlib')
options=('!libtool')
source=("http://xorg.freedesktop.org/releases/individual/lib/$_pkgname-$pkgver.tar.bz2")
md5sums=('273329a78c2e9ea189ac416c7fde94a1')

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
