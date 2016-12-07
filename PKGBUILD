# $Id: PKGBUILD 192016 2016-10-12 09:22:17Z jgc $
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Joeny Ang <ang(dot)joeny(at)gmail(dot)com>

_pkgname=simple-scan
pkgname=$_pkgname-3.12
pkgver=3.12.0
pkgrel=1
pkgdesc="Simple scanning utility - the version before they broke everything"
url="http://launchpad.net/simple-scan"
arch=(i686 x86_64)
license=(GPL3)
depends=(sane dconf gtk3 colord libgusb packagekit)
makedepends=(yelp-tools intltool vala)
provides=(simple-scan)
conflicts=(simple-scan)
source=(https://launchpad.net/$_pkgname/${pkgver:0:4}/$pkgver/+download/$_pkgname-$pkgver.tar.xz)
sha256sums=('a88719f6142ddfa24d154d1093c67b27ac491c059ac5c87cba3b36ebc04b21a6')


build() {
  cd $_pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --disable-schemas-compile
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
