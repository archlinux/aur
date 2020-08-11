# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=trueline
pkgname=${_pkgname}-git
pkgver=r43.c9f93a8
pkgrel=2
pkgdesc='Fast and extensible bash powerline prompt with true color and fancy icon support'
arch=('any')
url='https://github.com/petobens/trueline'
license=('MIT')
makedepends=('git')
optdepends=('nerd-fonts-jetbrains-mono: font support')
provides=("${_pkgname}")
install='readme.install'
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 "${_pkgname}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" "${_pkgname}/README.md"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" "${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
