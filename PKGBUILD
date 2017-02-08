# Maintainer: Michael DeGuzis <mdeguzis@gmail.com>
# Credit to Maxime Gauduin <alucryd@archlinux.org>

pkgname=retroarch-assets-xmb-git
_gitname=retroarch-assets
pkgver=r378.90b882d
pkgrel=1
pkgdesc='XMB menu assets for RetroArch (git-latest)'
arch=('any')
url='http://www.libretro.com/'
license=('GPL')
groups=('libretro')
depends=('retroarch')
makedepends=('git')
conflicts=('retroarch-assets-xmb')
provides=('retroarch-assets-xmb')
source=('git+https://github.com/libretro/retroarch-assets.git')
sha256sums=('SKIP')

pkgver() {

  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

package() {

  cd $_gitname

  install -dm 755 "${pkgdir}"/usr/share/libretro/assets
  cp -dr --no-preserve='ownership' xmb "${pkgdir}"/usr/share/libretro/assets/

}
