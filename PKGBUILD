# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Eric Belanger <eric.archlinux.org>
# Contributor: Fabio Scotoni <CCuleX.gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=extremetuxracer
pkgver=0.8.1
pkgrel=1
pkgdesc="Downhill racing game starring Tux"
arch=('x86_64')
url="https://sourceforge.net/projects/extremetuxracer/"
license=('GPL')
depends=('sfml' 'glu' 'freetype2')
makedepends=('csfml')
conflicts=('ppracer' 'etracer')
replaces=('ppracer' 'etracer')
source=("https://downloads.sourceforge.net/${pkgname}/etr-${pkgver}.tar.xz")
sha256sums=('92da963ed32ab9bff126346edfb9549e871d7c3cec753f4ac5098e0d53c38341')

build() {
  cd "${srcdir}/etr-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/etr-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/etr-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
