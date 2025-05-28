# Contributor: David Phillips < david sighup nz >
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Maintainer: tee < teeaur at duck dot com >

pkgname=cattle
pkgver=1.4.0
pkgrel=1
pkgdesc='Toolkit for the Brainfuck programming language'
arch=('x86_64')
url='https://kiyuko.org/software/cattle'
license=('GPL-2.0-only')
makedepends=('glib2-devel')
depends=('glib2')
options=('!libtool')
source=("$url/releases/${pkgname}-${pkgver}.tar.xz")
sha256sums=('9ba2d746f940978b5bfc6c39570dde7dc55d5b4d09d0d25f29252d6a25fb562f')

build() {
  cd "$pkgname-$pkgver"
  mkdir build
  cd build
  ../configure --prefix=/usr
  make
}

package() {
  make -C "$pkgname-$pkgver/build" install DESTDIR="$pkgdir"
}

# getver: kiyuko.org/software/cattle/releases
# vim:set ts=2 sw=2 et:
