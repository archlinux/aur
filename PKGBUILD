# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libretro-core-info-git
pkgver=r27.500790e
pkgrel=1
pkgdesc='Libretro core info files'
arch=('any')
url='https://github.com/libretro/libretro-core-info'
license=('GPL3')
groups=('libretro-unstable')
makedepends=('git')
provides=('libretro-core-info')
conflicts=('libretro-core-info')
source=('git+https://github.com/libretro/libretro-core-info.git')
sha256sums=('SKIP')

pkgver() {
  cd libretro-core-info

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd libretro-core-info

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
