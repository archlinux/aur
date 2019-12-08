# Maintainer: Mark Tompkins

pkgname=arch-silence-grub-theme-git
_gitname="arch-silence"
pkgver=r5.9fda3bf
pkgrel=1
pkgdesc="Arch Silence - GRUB2 theme - GIT version"
arch=('any')
license=('GPL')
depends=()
optdepends=()
install="${pkgname}.install"
url="https://github.com/fghibellini/arch-silence"
source=('git+https://github.com/fghibellini/arch-silence.git')
makedepends=('git')
md5sums=('SKIP')
conflicts=("arch-silence-grub-theme")

pkgver() {
  cd ${srcdir}/${_gitname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "${pkgdir}/boot/grub/themes/${_gitname}"
  cp -TR "${srcdir}/${_gitname}/theme" "${pkgdir}/boot/grub/themes/${_gitname}"
}
