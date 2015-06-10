#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=libxtrap
_pkgname=libXTrap
pkgdesc="X Trap extension"
pkgver=1.0.1
pkgrel=3
arch=('x86_64' 'i686')
url="http://www.x.org"
license=('custom')
depends=('libxt' 'libxext')
makedepends=('trapproto')
options=('!libtool')
source=("http://xorg.freedesktop.org/releases/individual/lib/$_pkgname-$pkgver.tar.bz2")
md5sums=('076ff6279d202f19421b51af4f723935')

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
