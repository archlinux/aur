# Maintainer: Nico <desoxhd@gmail.com>
pkgname="whitesur-cursor-theme-git"
_gitname=WhiteSur-cursors
pkgver=r3.1ada17d
pkgrel=1
pkgdesc="WhiteSur cursors theme for linux desktops"
arch=("any")
makedepends=('git')
url="https://github.com/vinceliuice/${_gitname}"
license=('GPL3')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "${pkgdir}/usr/share/icons/"
  cp -pr "${srcdir}/${_gitname}/dist" "${pkgdir}/usr/share/icons/${_gitname}"
}
