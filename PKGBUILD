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
sha512sums=('16d52c41192e65a90b795897ea66e9f615f1a3c47c99c49134ca2b099096380d165415403cecede6e9bcd56a32c4f5ba96af456f84d533a70c3811ca5661a721')

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
