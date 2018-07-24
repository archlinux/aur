# Maintainer : David Phillips < david sighup nz >
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=cattle
pkgver=1.2.2
pkgrel=1
pkgdesc='Toolkit for the Brainfuck programming language'
arch=('x86_64' 'i686')
url='https://kiyuko.org/software/cattle'
license=('GPL')
depends=('glib2')
options=('!libtool')
source=("https://kiyuko.org/software/${pkgname}/releases/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e8e9baba41c4b25a1fdac552c5b03ad62a4dbb782e9866df3c3463baf6411826')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  make -C "$pkgname-$pkgver" install DESTDIR="$pkgdir"
}

# getver: kiyuko.org/software/cattle/releases
# vim:set ts=2 sw=2 et:
