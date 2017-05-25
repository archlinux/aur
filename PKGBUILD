# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libretro-shaders-glsl-git
pkgver=r145.c3b252c
pkgrel=1
pkgdesc='Collection of GLSL shaders for libretro'
arch=('any')
url='http://www.libretro.com/'
license=('GPL3')
groups=('libretro')
provides=('libretro-shaders' 'libretro-shaders-glsl')
conflicts=('libretro-shaders' 'libretro-shaders-glsl')
makedepends=('git')
source=('libretro-shaders-glsl::git+https://github.com/libretro/glsl-shaders.git')
sha256sums=('SKIP')

pkgver() {
  cd libretro-shaders-glsl

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  install -dm 755 "${pkgdir}"/usr/share/libretro
  cp -dr --no-preserve='ownership' libretro-shaders-glsl "${pkgdir}"/usr/share/libretro/shaders
  rm -rf "${pkgdir}"/usr/share/libretro/shaders/.git
}

# vim: ts=2 sw=2 et:
