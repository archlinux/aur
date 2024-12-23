# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="protoc-gen-go"
pkgname="${_pkgname}-bin"
pkgver=1.36.1
pkgrel=1
pkgdesc="Go support for Google's protocol buffers"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/protocolbuffers/protobuf-go"
license=('BSD-3-Clause')
optdepends=('protobuf: protoc generator')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE"
        "PATENTS-${pkgver}::${url}/raw/v${pkgver}/PATENTS")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}.v${pkgver}.linux.amd64.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}.v${pkgver}.linux.arm64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}.v${pkgver}.linux.386.tar.gz")
sha256sums=('12156774520d841d748bcd4acba1ad6b24952f2766ceb5e873c32653a9ab3a2e'
            '4835612df0098ca95f8e7d9e3bffcb02358d435dbb38057c844c99d7f725eb20'
            '96f408bfae65bf137fc2525d3ecb030271c50c1e90799f87abf8846d8dd505cc')
sha256sums_x86_64=('92b02dda358947d196756f4a21adb6265135ae6c9bc92cb2e2583b7be164e6c0')
sha256sums_aarch64=('1919d18b674088d6c403b794e4d84c2ab3e53afe1f6860c05eb04cda658ae0d2')
sha256sums_i686=('abd58468b494b925bb4f99c243edaabe9b7536893d94bcccccc23621b20eb966')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"         "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "PATENTS-${pkgver}"   "${pkgdir}/usr/share/doc/${_pkgname}/PATENTS"
  install -vDm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
