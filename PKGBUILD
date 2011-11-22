# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libepc
pkgver=0.4.3
pkgrel=1
pkgdesc="Easy Publish and Consume Library"
arch=(i686 x86_64)
license=('LGPL')
url="http://live.gnome.org/libepc"
depends=('gtk3' 'avahi' 'libsoup')
makedepends=('intltool')
options=('!libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/$pkgname/0.4/$pkgname-$pkgver.tar.xz)
sha256sums=('57303bc180ef1447e060a64590fd359365390e14a90dddc8b8af8d3a6551e454')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
