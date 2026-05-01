# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="hack-browser-data"
pkgname="${_pkgname}-bin"
pkgver=1.0.0
pkgrel=1
pkgdesc="Extract and decrypt browser data, supporting multiple data types"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'x86_64'
)
url="https://github.com/moonD4rk/HackBrowserData"
license=(
  'MIT'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
source_aarch64=(
  "${_pkgname}-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64.tar.gz"
)
source_armv7h=(
  "${_pkgname}-${pkgver}-linux-arm.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm.tar.gz"
)
source_i686=(
  "${_pkgname}-${pkgver}-linux-32bit.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-32bit.tar.gz"
)
source_x86_64=(
  "${_pkgname}-${pkgver}-linux-64bit.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-64bit.tar.gz"
)
sha256sums_aarch64=('40a7bb408f28727bd5b30574d071ea9ceee15a75c82a13b16a5c90c1cdc9d4bd')
sha256sums_armv7h=('e0d0c25bc5b476b3826a45232a058bc34363b13a043539f7eb0ac3be6b7a836e')
sha256sums_i686=('f5fe3ebcdfdd0493288ce83794baf2ef9d7bf614eae82c8d0f6d777c606d227f')
sha256sums_x86_64=('9d75108d774675195f35a58ee9072b0a0fd8311cfb159fe08e241e647a27cb06')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"    "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"      "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  # install -vDm644 "README_ZH.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"        "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
