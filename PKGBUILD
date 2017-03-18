# $Id$
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Joeny Ang <ang(dot)joeny(at)gmail(dot)com>
# https://launchpad.net/simple-scan/3.23/3.23.90/+download/simple-scan-3.23.90.tar.xz


pkgname=simple-scan
pkgver=3.23.92
pkgrel=1
pkgdesc="Simple scanning utility"
url="http://launchpad.net/simple-scan"
arch=(i686 x86_64)
license=(GPL3)
depends=(sane dconf gtk3 colord libgusb packagekit)
makedepends=(yelp-tools intltool vala)
source=(https://launchpad.net/$pkgname/${pkgver:0:4}/$pkgver/+download/$pkgname-$pkgver.tar.xz)
sha256sums=('ddbc6d5eda4bde1d4e0822075889a6cf93354869008792311da7526c2c7c6b58')

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
