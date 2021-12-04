# Maintainer: Nico <d3sox at protonmail dot com>
pkgname="whitesur-cursor-theme-git"
_gitname=WhiteSur-cursors
pkgver=r6.2cb7219
pkgrel=2
pkgdesc="WhiteSur cursors theme for linux desktops"
arch=("any")
makedepends=('git')
provides=('whitesur-cursor-theme')
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
