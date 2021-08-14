# Maintainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Contributor: Nikita Ukhrenkov <thekit@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

_pkgname=icd2-osso-ic-dev
pkgname=icd2-osso-ic-headers
pkgver=2.0.1
pkgrel=1
pkgdesc="Compatibility header files for osso-ic-headers"
url="https://github.com/maemo-leste/$_pkgname"
arch=(any)
license=(LGPL)
makedepends=(libtool m4 autoconf automake libtool)
groups=(maemo)
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
  cd $_pkgname
  ./autogen.sh
}

build() {
  cd $_pkgname
  CFLAGS="$CFLAGS -Wno-error=deprecated-declarations" ./configure --prefix=/usr
  make
 }

package() {
  cd $_pkgname
  DESTDIR="$pkgdir" make install
}
