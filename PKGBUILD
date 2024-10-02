# Maintainer: Vojta Kottas <vojta.kottas@gmail.com>

pkgname=arch-simplicity-grub-theme-git
_theme_name=arch-simplicity
pkgver=r8.5cc2ad0
pkgrel=1
pkgdesc="A Simple Grub Theme"
arch=('any')
license=('GPL')
depends=()
optdepends=()
install="${_theme_name}.install"
url="https://codeberg.org/TheSmilingTurtle/arch-simplicity.git"
source=('git+https://codeberg.org/TheSmilingTurtle/arch-simplicity.git')
makedepends=('git')
sha512sums=('SKIP')
conflicts=()
provides=()

pkgver() {
  cd ${srcdir}/${_theme_name}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "${pkgdir}/boot/grub/themes/${_theme_name}"
  cp -TR "${srcdir}/${_theme_name}/theme" "${pkgdir}/boot/grub/themes/${_theme_name}"
}
