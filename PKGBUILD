# Maintainer: Raymond Wanyoike <raymond[dot]wanyoike[at]gmail[dot]com>

_gitauthor=galliumos
_gitname=galliumos-base

pkgname="${_gitname}-git"
pkgver="r70.717a92d"
pkgrel=1
pkgdesc="GalliumOS base files"
arch=("any")
url="https://github.com/${_gitauthor}/${_gitname}"
license=("GPL")
makedepends=("git")
provides=("${_gitname}")
conflicts=("${_gitname}")
source=("git+https://github.com/${_gitauthor}/${_gitname}.git")
sha256sums=("SKIP")

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_gitname}"
  install -m644 -Dt "${pkgdir}/etc/sysctl.d" etc/sysctl.d/20-galliumos.conf
}
