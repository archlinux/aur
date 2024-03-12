# Maintainer: Toxopeus S. <sam@toxopeus.it>
pkgname=sevi-icon-theme-full
_gitname=Sevi
pkgver=r255.0e0a590
pkgrel=1
pkgdesc="A colorful design icon theme based on Reversal - All Versions"
arch=('any')
makedepends=('git' 'gtk-update-icon-cache')
license=('CC BY-SA 4.0')
url="https://github.com/TaylanTatli/${_gitname}"
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
