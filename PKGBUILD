#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=xorg-xsm
_pkgname=xsm
pkgdesc="X Session Manager"
pkgver=1.0.3
pkgrel=2
arch=('x86_64' 'i686')
url="http://www.x.org/"
license=('custom')
depends=('libxaw' 'xorg-smproxy' 'xorg-iceauth' 'xorg-rstart')
optdepends=('xorg-twm: for window manager in default scripts')
source=("http://xorg.freedesktop.org/releases/individual/app/$_pkgname-$pkgver.tar.bz2")
md5sums=('2a9818eba05556e6e99be87d9b3974c4')

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
