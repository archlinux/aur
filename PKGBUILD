# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libretro-shaders-cg-git
pkgver=r694.bd382e3
pkgrel=1
pkgdesc='Collection of Cg shaders for libretro'
arch=('any')
url='http://www.libretro.com/'
license=('GPL3')
groups=('libretro')
provides=('libretro-shaders' 'libretro-shaders-cg')
conflicts=('libretro-shaders' 'libretro-shaders-cg')
depends=('nvidia-cg-toolkit')
makedepends=('git')
source=('libretro-shaders-cg::git+https://github.com/libretro/common-shaders.git')
sha256sums=('SKIP')

pkgver() {
  cd libretro-shaders-cg

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  install -dm 755 "${pkgdir}"/usr/share/libretro
  cp -dr --no-preserve='ownership' libretro-shaders-cg "${pkgdir}"/usr/share/libretro/shaders
  rm -rf "${pkgdir}"/usr/share/libretro/shaders/.git
}

# vim: ts=2 sw=2 et:
