# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gdl
pkgver=3.8.1
pkgrel=1
pkgdesc="GNOME Docking Library"
arch=(i686 x86_64)
license=('GPL')
url="http://www.gnome.org/"
depends=('gtk3')
makedepends=('gtk-doc' 'intltool' 'gobject-introspection')
options=('!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('c9911e9eec5a62497fff7e044ca9eaae47354658238e6b9e9a0a744f05b4ebdb')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
