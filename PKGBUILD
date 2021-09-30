# Maintainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Contributor: Nikita Ukhrenkov <thekit@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

pkgname=clockd
pkgver=0.0.43
pkgrel=1
pkgdesc="Provides centralized place for handling time."
url="https://github.com/maemo-leste/$pkgname"
arch=(any)
license=(LGPL2)
makedepends=(glib2 dbus-glib gconf cityinfo git)
groups=(maemo)
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
  DESTDIR="$pkgdir" make install
  libtool --finish /usr/lib
}
