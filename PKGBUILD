# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=gogextract
pkgname=${_pkgname}-git
pkgver=r2.6601b32
pkgrel=1
pkgdesc="Unpack GOG Linux installers"
arch=('any')
url="https://github.com/Yepoleb/${_pkgname}"
license=('MIT')
source=("git+${url}.git")
depends=('python')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  install -Dm755 "${_pkgname}.py" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}