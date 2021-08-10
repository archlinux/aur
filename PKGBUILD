# Maintainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>

pkgname=libcal
pkgver=0.3.1
pkgrel=1
pkgdesc="Hildon Desktop Library"
url="https://github.com/maemo-leste/libcal"
arch=(any)
license=(GPL)
depends=() 
makedepends=(autoconf)
checkdepends=()
provides=($_pkgname)
conflicts=($_pkgname)
groups=(gnome)
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd $pkgname
  autoreconf -i
  ./configure --prefix=/usr
  CFLAGS="$CFLAGS -Wno-deprecated-declarations" make
 }

package() {
  cd $pkgname
  make DESTDIR=$pkgdir install
  libtool --finish /usr/lib
}
