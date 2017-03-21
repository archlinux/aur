# $Id: PKGBUILD 192016 2016-10-12 09:22:17Z jgc $
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Joeny Ang <ang(dot)joeny(at)gmail(dot)com>

pkgname=simple-scan
pkgver=3.24.0
pkgrel=1
pkgdesc="Simple scanning utility (trunk version)"
url="http://launchpad.net/simple-scan"
arch=(i686 x86_64)
license=(GPL3)
depends=(sane dconf gtk3 colord libgusb packagekit)
makedepends=(yelp-tools intltool vala)
provides=(simple-scan)
conflicts=(simple-scan)
source=(https://launchpad.net/$pkgname/${pkgver:0:4}/$pkgver/+download/$pkgname-$pkgver.tar.xz)
sha256sums=('22a44ecfb28b5963f896f1d9f42e789e711f0c1aa9a73fa3c1d74ebb6ca374a6')


build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --disable-schemas-compile
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
