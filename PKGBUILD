# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Eric Belanger <eric.archlinux.org>
# Contributor: Fabio Scotoni <CCuleX.gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
pkgname=extremetuxracer
pkgver=0.8.4
pkgrel=1
pkgdesc="Downhill racing game starring Tux"
arch=(x86_64)
url="https://sourceforge.net/projects/${pkgname}"
license=(GPL-2.0-or-later)
depends=(sfml glu freetype2)
makedepends=(csfml)
source=(https://downloads.sourceforge.net/${pkgname}/etr-${pkgver}.tar.xz)
sha512sums=('65d54bfef59cf83eec9ee761ac24c728d3118cf47105920f22057b59425eba65e03967196d4a93039f30b9420e67b10f296ec7deed7e506ad78c7bb5ce5ed0d2')

build() {
  cd etr-${pkgver}
  ./configure --prefix=/usr
  make
}

check() {
  cd etr-${pkgver}
  make check
}

package() {
  cd etr-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
