# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libepc
pkgver=0.4.5
pkgrel=2
pkgdesc="Easy Publish and Consume Library"
arch=(x86_64)
license=('LGPL')
url="https://wiki.gnome.org/Projects/libepc"
depends=('gtk3' 'avahi' 'libsoup')
makedepends=('intltool')
source=(https://download.gnome.org/sources/$pkgname/0.4/$pkgname-$pkgver.tar.xz)
sha256sums=('4f98fc306c0f9d361e1381484744246efd084053732924741078270c49afc33b')

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
