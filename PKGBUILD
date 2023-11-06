# Maintainer: Igor Saric <karabaja4 at gmail.com>

_gitname=permof
_version=1.0
pkgname=${_gitname}-git
pkgver=${_version}.b5cff53
pkgrel=1
pkgdesc="Visualize Linux file permissions"
arch=('any')
url="https://github.com/karabaja4/${_gitname}"
license=('GPL3')
depends=('coreutils' 'findutils' 'bash' 'bc')
makedepends=('git')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo "${_version}.$(git rev-parse --short HEAD)"
}

package() {
  cd "${_gitname}"
  install -Dm755 "src/permof.sh" "${pkgdir}/usr/bin/permof"
}
