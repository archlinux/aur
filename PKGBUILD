# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libretro-shaders-slang-git
pkgver=r370.b91c670
pkgrel=1
pkgdesc='Collection of Vulkan shaders for libretro'
arch=('any')
url='http://www.libretro.com/'
license=('GPL3')
groups=('libretro')
provides=('libretro-shaders' 'libretro-shaders-slang')
conflicts=('libretro-shaders-slang' 'libretro-shaders-slang')
makedepends=('git')
source=('libretro-shaders-slang::git+https://github.com/libretro/slang-shaders.git')
sha256sums=('SKIP')

pkgver() {
  cd libretro-shaders-slang

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  install -dm 755 "${pkgdir}"/usr/share/libretro
  cp -dr --no-preserve='ownership' libretro-shaders-slang "${pkgdir}"/usr/share/libretro/shaders
  rm -rf "${pkgdir}"/usr/share/libretro/shaders/.git
}

# vim: ts=2 sw=2 et:
