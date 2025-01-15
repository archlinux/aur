# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="protoc-gen-go"
pkgname="${_pkgname}-bin"
pkgver=1.36.3
pkgrel=1
pkgdesc="Go support for Google's protocol buffers"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/protocolbuffers/protobuf-go"
license=('BSD-3-Clause')
depends=('protobuf')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/refs/tags/v${pkgver}/LICENSE"
        "PATENTS-${pkgver}::${url}/raw/refs/tags/v${pkgver}/PATENTS")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}.v${pkgver}.linux.arm64")
source_i686=("${_pkgsrc}-i686::${url}/releases/download/v${pkgver}/${_pkgname}.v${pkgver}.linux.386")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}.v${pkgver}.linux.amd64")
sha256sums=('12156774520d841d748bcd4acba1ad6b24952f2766ceb5e873c32653a9ab3a2e'
            '4835612df0098ca95f8e7d9e3bffcb02358d435dbb38057c844c99d7f725eb20'
            '96f408bfae65bf137fc2525d3ecb030271c50c1e90799f87abf8846d8dd505cc')
sha256sums_aarch64=('9efc8f8fd2a4d8c065bb32fbcf2daecfd9ba1c5deee2832788e864b1346dac74')
sha256sums_i686=('6953f843ba4374f76bc423ae11657b26d385b8a0a0348fbb6cd92acacc52999f')
sha256sums_x86_64=('cf327d0357e5352b1b8bdfe96fbc7d4817b3c0287df466472bf4f21aedbfd2e5')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "PATENTS-${pkgver}"   "${pkgdir}/usr/share/doc/${_pkgname}/PATENTS"
  install -vDm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
