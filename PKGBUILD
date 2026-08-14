# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="protoc-gen-go"
pkgname="${_pkgname}-bin"
pkgver=1.36.12
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
sha256sums_aarch64=('bf385e22e18661b044f7b96ec28384f3f76aa6da10e956b450ffb949306768de')
sha256sums_i686=('218fec8945785359113c2fa2a8c4147d2455712a340baba0d795ae2653814ad4')
sha256sums_x86_64=('14abe70d1557026d3dce6676b7a44d3ada91d79902c71cb075fbb8d315943320')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
