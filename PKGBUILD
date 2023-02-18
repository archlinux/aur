# Maintainer: Serhii Hordiienko <phrippy2@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Eric Belanger <eric.archlinux.org>
# Contributor: Fabio Scotoni <CCuleX.gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=extremetuxracer-ukr-lat
pkgver=0.8.2
pkgrel=1
pkgdesc="Downhill racing game starring Tux"
arch=('x86_64')
url="https://sourceforge.net/projects/extremetuxracer"
license=('GPL')
depends=('sfml' 'glu' 'freetype2')
makedepends=('csfml' 'git')
conflicts=('ppracer' 'etracer' 'extremetuxracer')
replaces=('ppracer' 'etracer' 'extremetuxracer')
source=("https://github.com/phrippy/extremetuxracer/archive/refs/heads/${pkgver}.zip")
sha512sums=('1b329d7d2364fa2a629a3266e83f829835c3b16b0a8a863d08168f4fb5f5709948be92f50123deaad2f844e3d229e9b39392ba4a622fb91c68a96b459d78245f')

build() {
	cd extremetuxracer-${pkgver}
  ./configure --prefix=/usr
  make
}

check() {
	cd extremetuxracer-${pkgver}
  make check
}

package() {
	cd extremetuxracer-${pkgver}
  make DESTDIR="${pkgdir}" install
}
