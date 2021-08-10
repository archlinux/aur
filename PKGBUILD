# Maintainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>

pkgname=libhildon
pkgver=2.2.28
pkgrel=1
pkgdesc="Hildon Desktop Library"
url="https://github.com/maemo-leste/libhildon"
arch=(any)
license=(GPL)
depends=(gtk3) 
makedepends=()
checkdepends=()
provides=($pkgname)
conflicts=($pkgname)
groups=(gnome)
source=("git+$url.git#tag=$_pkgver")
sha256sums=('SKIP')

build() {
  cd $pkgname
  ./autogen.sh --prefix=$pkgdir/usr \
               --with-maemo-gtk=no
  make
 }
package() {
  cd $pkgname
  DESTDIR=$pkgdir make install
}
