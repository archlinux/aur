# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='bashbc'
pkgname="${_pkgname}-git"
pkgver=r3.ec9133d
pkgrel=1
pkgdesc='Command-line calculator in pure BASH'
arch=('any')
url='https://github.com/bluebat/.bash'
license=('GPL')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 "${_pkgname}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
}

# vim: ts=2 sw=2 et:
