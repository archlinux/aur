# Maintainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>

pkgname=libhildonmime
pkgver=3.0.3
pkgrel=1
pkgdesc="Hildon MIME library"
url="https://github.com/maemo-leste/libhildonmime"
arch=(any)
license=(LGPL-2.1-only)
makedepends=(glib2 dbus-glib libxml2 gtk-doc
             autoconf automake m4 libtool)
checkdepends=()
provides=($_pkgname)
conflicts=($_pkgname)
groups=(gnome)
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd $pkgname
  ./autogen.sh --prefix=/usr CFLAGS="${CFLAGS} -Wno-error=unused-but-set-variable"
  make
 }

package() {
  cd $pkgname
  make DESTDIR=$pkgdir install
}
