# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >

pkgname=renaissance
_pkgname=Renaissance
pkgrel=1
pkgver=0.9.0
pkgdesc='GNUstep GUI Framework'
arch=('i686' 'x86_64' 'armv7h')
url='https://tracker.debian.org/pkg/renaissance'
license=('LGPL-2.1+')
depends=('gnustep-base' 'gnustep-gui')
makedepends=('gcc-objc' 'gnustep-make')
source=("http://http.debian.net/debian/pool/main/r/renaissance/renaissance_0.9.0.orig.tar.gz")
sha256sums=('5c2078d211dd9d9de48c8d26d3dde3f7fae18fadeac1ff4049e5996a29ce342b')

build() {
  cd "$_pkgname-$pkgver"
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
