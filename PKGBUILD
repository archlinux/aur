# Maintainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Contributor: Nikita Ukhrenkov <thekit@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

pkgname=statusbar-alarm-dbus
_pkgname=$pkgname-api
pkgver=0.5.11
pkgrel=1
pkgdesc="Plugin showing current time and alarm set"
url="https://github.com/maemo-leste/$_pkgname"
arch=(any)
license=(LGPL)
makedepends=(git)
groups=(maemo)
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
  cd $_pkgname
  ./autogen.sh
}

build() {
  cd $_pkgname
  ./configure --prefix=/usr
  make
 }

package() {
  cd $_pkgname
  DESTDIR="$pkgdir" make install
  libtool --finish /usr/lib
}
