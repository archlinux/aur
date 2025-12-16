# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="protoc-gen-go"
pkgname="${_pkgname}-bin"
pkgver=1.36.11
pkgrel=1
pkgdesc="Go support for Google's protocol buffers"
arch=(
  'aarch64'
  'i686'
  'x86_64'
)
url="https://github.com/protocolbuffers/protobuf-go"
license=(
  'BSD-3-Clause'
)
depends=(
  'protobuf'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
)
source_aarch64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}.v${pkgver}.linux.arm64.tar.gz"
)
source_i686=(
  "${url}/releases/download/v${pkgver}/${_pkgname}.v${pkgver}.linux.386.tar.gz"
)
source_x86_64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}.v${pkgver}.linux.amd64.tar.gz"
)
sha256sums=('12156774520d841d748bcd4acba1ad6b24952f2766ceb5e873c32653a9ab3a2e'
            '4835612df0098ca95f8e7d9e3bffcb02358d435dbb38057c844c99d7f725eb20')
sha256sums_aarch64=('8760755b06cbfe6e64478bbe16b60e518d89d059ccaf667df05398d19636cbad')
sha256sums_i686=('a2297f4bd8efc5ac716e614093cd43afdd867291dd6ae4942765cd3b2632c8f1')
sha256sums_x86_64=('6ad8f8fc11b96dc4deb176f7ee84af40e15d32e4608594bcc3534b7824a3dc71')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
