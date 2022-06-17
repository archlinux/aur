# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Eric Belanger <eric.archlinux.org>
# Contributor: Fabio Scotoni <CCuleX.gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=extremetuxracer
pkgver=0.8.2
pkgrel=1
pkgdesc="Downhill racing game starring Tux"
arch=('x86_64')
url="https://sourceforge.net/projects/${pkgname}"
license=('GPL')
depends=('sfml' 'glu' 'freetype2')
makedepends=('csfml')
conflicts=('ppracer' 'etracer')
replaces=('ppracer' 'etracer')
source=("https://downloads.sourceforge.net/${pkgname}/etr-${pkgver}.tar.xz")
sha512sums=('572b494e82f00853b38b3913f0ef34d0a5c0b6655626fa6c72c76f7a41f723ff6fc3c20ca54d835ed5dba462f22896882e9c37ddf5b3e840ea14af3d336addb8')

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
}
