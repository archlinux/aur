# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-beetle-ngp-git
pkgver=r845.69293c9
pkgrel=1
pkgdesc='Neo Geo Pocket/Color core'
arch=('x86_64')
url='https://github.com/libretro/beetle-ngp-libretro'
license=('GPL2')
groups=('libretro-unstable')
depends=('libretro-core-info')
makedepends=('git')
provides=('libretro-beetle-ngp' 'libretro-mednafen-ngp-git')
conflicts=('libretro-beetle-ngp' 'libretro-mednafen-ngp-git')

source=('libretro-beetle-ngp::git+https://github.com/libretro/beetle-ngp-libretro.git')
sha256sums=('SKIP')

pkgver() {
  cd libretro-beetle-ngp

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  make -C libretro-beetle-ngp
}

package() {
  install -Dm 644 libretro-beetle-ngp/mednafen_ngp_libretro.so -t "${pkgdir}"/usr/lib/libretro/
}

# vim: ts=2 sw=2 et:
