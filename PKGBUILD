# Maintainer: Michael DeGuzis <mdeguzis@gmail.com>
# Credit: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libretro-overlays-git
_gitname=libretro-overlays
pkgver=r101.ee11805
pkgrel=1
pkgdesc='Collection of overlays for libretro (git-latest)'
arch=('any')
url='http://www.libretro.com/'
license=('GPL')
groups=('libretro')
makedepends=('git')
conflicts=('libretro-overlays')
provides=('libretro-overlays')
source=('libretro-overlays::git+https://github.com/libretro/common-overlays.git')
sha256sums=('SKIP')

pkgver() {

  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

package() {

  cd $_gitname

  install -dm 755 "${pkgdir}"/usr/share/libretro/overlays
  cp -dr --no-preserve='ownership' * "${pkgdir}"/usr/share/libretro/overlays/

}

