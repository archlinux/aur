# Maintainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Contributor: Nikita Ukhrenkov <thekit@disroot.org>

pkgname=libhildon
pkgver=2.2.28
pkgrel=2
pkgdesc="Hildon Desktop Library"
url="https://github.com/maemo-leste/libhildon"
arch=(any)
license=(GPL)
depends=(gtk2-maemo) 
makedepends=(make)
checkdepends=()
provides=($pkgname)
conflicts=($pkgname)
groups=(gnome)
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd $pkgname
  ./autogen.sh --prefix=/usr
  make
 }
package() {
  cd $pkgname
  make DESTDIR=${pkgdir} install
}
