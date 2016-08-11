# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgbase=libretro-shaders-git
pkgname=('libretro-shaders-cg-git' 'libretro-shaders-glsl-git' 'libretro-shaders-slang-git')
pkgver=r620.8b69647
pkgrel=1
pkgdesc='Collection of shaders for libretro'
arch=('any')
url='http://www.libretro.com/'
license=('GPL3')
groups=('libretro')
makedepends=('git' 'nvidia-cg-toolkit' 'python' 'retroarch')
source=('git+https://github.com/libretro/common-shaders.git'
        'git+https://github.com/libretro/slang-shaders.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd common-shaders

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  retroarch-cg2glsl common-shaders glsl-shaders
}

package_libretro-shaders-cg-git() {
  install -dm 755 "${pkgdir}"/usr/share/libretro
  cp -dr --no-preserve='ownership' common-shaders "${pkgdir}"/usr/share/libretro/shaders
}

package_libretro-shaders-glsl-git() {
  install -dm 755 "${pkgdir}"/usr/share/libretro
  cp -dr --no-preserve='ownership' glsl-shaders "${pkgdir}"/usr/share/libretro/shaders
}

package_libretro-shaders-slang-git() {
  install -dm 755 "${pkgdir}"/usr/share/libretro
  cp -dr --no-preserve='ownership' slang-shaders "${pkgdir}"/usr/share/libretro/shaders
}

# vim: ts=2 sw=2 et:
