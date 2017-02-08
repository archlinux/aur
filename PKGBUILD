# Maintainer: Michael DeGuzis <mdeguzis@gmail.com>
# Credit: Maxime Gauduin <alucryd@archlinux.org>

pkgname=retroarch-autoconfig-udev-git
_gitname=retroarch-joypad-autoconfig
pkgver=r1111.be1442f
pkgrel=1
pkgdesc='udev joypad autoconfig for RetroArch (git-latest)'
arch=('any')
url='http://www.libretro.com/'
license=('GPL')
groups=('libretro')
depends=('retroarch')
makedepends=('git')
provides=('retroarch-autoconfig-udev')
conflicts=('retroarch-autoconfig-udev')
source=('git+https://github.com/libretro/retroarch-joypad-autoconfig.git')
sha256sums=('SKIP')

pkgver() {

  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

package() {

  cd $_gitname

  install -dm 755 "${pkgdir}"/usr/share/libretro/autoconfig
  cp -dr --no-preserve='ownership' udev "${pkgdir}"/usr/share/libretro/autoconfig/

}
