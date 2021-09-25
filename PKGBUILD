# Maintainer: Anthony Wang <ta180m@pm.me>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libretro-yabause-git
pkgver=r3321.12c869191
pkgrel=1
pkgdesc='Sega Saturn core'
arch=('i686' 'x86_64')
url='https://github.com/libretro/yabause'
license=('GPL2')
groups=('libretro-unstable')
depends=('glew' 'glibc' 'libretro-core-info')
makedepends=('git')
provides=('libretro-yabause')
conflicts=('libretro-yabause')
source=('libretro-yabause::git+https://github.com/libretro/yabause.git')
sha256sums=('SKIP')

pkgver() {
  cd libretro-yabause

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  make -C libretro-yabause/yabause/src/libretro
}

package() {
  install -Dm 644 libretro-yabause/yabause/src/libretro/yabause_libretro.so -t "${pkgdir}"/usr/lib/libretro/
}

# vim: ts=2 sw=2 et:
