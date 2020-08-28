# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: kusakata <shohei atmark kusakata period com>

_pkgname='piu-piu'
pkgname="${_pkgname}-sh-git"
pkgver=r373.4ecf0ea
pkgrel=1
pkgdesc='Old School horizontal scroller "Shoot Them All" game in bash'
arch=('any')
url='https://github.com/vaniacer/piu-piu-SH'
license=('MIT')
makedepends=('git')
optdepends=('netcat: multiplayer mode')
provides=("${_pkgname}")
conflicts=("${_pkgname}-sh")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
  install -Dm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
