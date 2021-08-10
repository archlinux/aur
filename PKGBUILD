# Maintainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>

_pkgname=libhildon
pkgname=$_pkgname-git
pkgver=2.2.28
pkgrel=1
pkgdesc="Hildon Desktop Library"
url="https://github.com/maemo-leste/libhildon"
arch=(any)
license=(GPL)
depends=(gtk3) 
makedepends=()
checkdepends=()
provides=($_pkgname)
conflicts=($_pkgname)
groups=(gnome)
source=("git+$url.git#tag=$_pkgver")
sha256sums=('SKIP')

build() {
  cd $_pkgname
  ./autogen.sh --prefix=$pkgdir/usr \
               --with-maemo-gtk=no
  make
 }
package() {
  cd $_pkgname
  DESTDIR=$pkgdir make install
}
