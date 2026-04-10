# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="gsa"
_pkgname="go-size-analyzer"
pkgname="${_pkgname}-bin"
pkgver=1.12.2
pkgrel=1
pkgdesc="A tool for analyzing the dependencies in compiled Golang binaries"
arch=(
  'aarch64'
  'x86_64'
)
url="https://gsa.zxilly.dev"
_url="https://github.com/Zxilly/${_pkgname}"
license=(
  'AGPL-3.0-only'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
source_aarch64=(
  "${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz"
)
source_x86_64=(
  "${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz"
)
sha256sums_aarch64=('54b47182812167e0c0f86cf4c59ff45205f0118d16c3c02f5c04867d0ffd91d1')
sha256sums_x86_64=('cd70929815af6d39c8430fc515796997a3f45bb94ce7b987c1ebe6732f715e1b')

package() {
  cd "${srcdir}"
  install -vDm755 "${_binname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  # install -vDm644 "README_zh_CN.md" "${pkgdir}/usr/share/doc/${_pkgname}/README_zh_CN.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  ln -vsf "${_pkgname}" "${pkgdir}/usr/bin/${_binname}"
}
