# Contributor: Felix Golatofski
# Contributor: Mark Tompkins

_pkgname=arch-silence-grub-theme
pkgname=arch-silence-grub-theme-git
_gitname="arch-silence"
pkgver=r7.cd4bba1
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
sha512sums=('SKIP')
conflicts=("$_pkgname")
provides=("$_pkgname=$pkgver")

pkgver() {
  cd ${srcdir}/${_gitname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "${pkgdir}/boot/grub/themes/${_gitname}"
  cp -TR "${srcdir}/${_gitname}/theme" "${pkgdir}/boot/grub/themes/${_gitname}"
}
