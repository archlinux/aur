# Maintainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Contributor: Nikita Ukhrenkov <thekit@disroot.org>

pkgname=libhildonfm
pkgver=2.28.27
pkgrel=1
pkgdesc="Hildon file management libraries"
url="https://github.com/maemo-leste/$pkgname"
arch=(any)
license=(LGPL)
depends=(libhildon xdg-user-dirs) 
makedepends=(gconf mce-headers libpng libosso hildon-thumbnail libhildonmime
             autoconf automake m4 libtool)
checkdepends=()
groups=(hildon)
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd $pkgname
  ./autogen.sh 
  ./configure --prefix=/usr
  make
 }

package() {
  cd $pkgname
  make DESTDIR=$pkgdir install
  rm $pkgdir/etc/xdg/user-dirs.defaults
}
