# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=reversal-icon-theme-git
_gitname=Reversal-icon-theme
pkgver=r68.3e973a1
pkgrel=1
pkgdesc="A colorful Design Rectangle icon theme for linux desktops"
arch=('any')
makedepends=('git' 'gtk-update-icon-cache')
license=('GPL3')
url="https://github.com/yeyushengfan258/${_gitname}"
source=("git+${url}.git")
sha256sums=('SKIP')
options=('!strip')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_gitname}"
  install -dm755 "${pkgdir}/usr/share/icons"
  ./install.sh -a -d "${pkgdir}/usr/share/icons"
}
