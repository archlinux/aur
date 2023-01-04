# Maintainer: Tales A. Mendonça <talesam@gmail.com>
pkgname=sevi-icon-theme-blue-dark
_gitname=Sevi
pkgver=r194.959a351
pkgrel=1
pkgdesc="A colorful design icon theme based on Reversal - Blue Dark"
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
  ./install.sh -blue -d "${pkgdir}/usr/share/icons"
}
