# Maintainer: Serhii Hordiienko <phrippy2@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Eric Belanger <eric.archlinux.org>
# Contributor: Fabio Scotoni <CCuleX.gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=extremetuxracer-ukr-lat
pkgver=0.8.2
pkgrel=2
pkgdesc="Downhill racing game starring Tux"
arch=('x86_64')
url="https://sourceforge.net/projects/extremetuxracer"
license=('GPL')
depends=('sfml' 'glu' 'freetype2')
makedepends=('csfml' 'git')
conflicts=('ppracer' 'etracer' 'extremetuxracer')
replaces=('ppracer' 'etracer' 'extremetuxracer')
source=("https://github.com/phrippy/extremetuxracer/archive/refs/heads/${pkgver}.zip")
sha512sums=('8a3f2c2fffd16fcdfea7f4e57bb1ad74cd9756a021b550f498735adb31dda18ceb68d502adc3aa112a851d8298f5d9ef553c00e3c19d4ebdfdd9de31920efdcd')

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
