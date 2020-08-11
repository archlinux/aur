# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=gogextract
pkgname=${_pkgname}-git
pkgver=r2.6601b32
pkgrel=2
pkgdesc='Unpack GOG Linux installers'
arch=('any')
url='https://github.com/Yepoleb/gogextract'
license=('MIT')
depends=('python')
makedepends=('git')
provides=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 "${_pkgname}/${_pkgname}.py" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" "${_pkgname}/README.md"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" "${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
