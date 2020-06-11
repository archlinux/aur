# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=djvupages
pkgname=${_pkgname}-git
pkgver=r5.3b9ab4f
pkgrel=1
pkgdesc="Shell utility to manipulate pages of DjVu file"
arch=('any')
url="https://github.com/ashipunov/${_pkgname}"
license=('unknown')
source=("git+${url}.git")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "NEWS" "${pkgdir}/usr/share/doc/${_pkgname}/NEWS"
  install -Dm644 "README" "${pkgdir}/usr/share/doc/${_pkgname}/README"
  install -Dm644 "TODO" "${pkgdir}/usr/share/doc/${_pkgname}/TODO"
}