pkgname=osm-gps-map
pkgver=1.0.2
pkgrel=1
pkgdesc="Gtk+ widget for displaying OpenStreetMap tiles"
arch=(i686 x86_64)
url="http://nzjrs.github.io/$pkgname"
license=('GPL')
depends=('cairo' 'libsoup')
makedepends=('gtk-doc' 'gobject-introspection')
source=("https://github.com/nzjrs/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('4ac0e5c58e2ff1add68eb51d17eab04e')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --enable-gtk-doc
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
