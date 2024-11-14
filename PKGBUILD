# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="protoc-gen-go"
pkgname="${_pkgname}-bin"
pkgver=1.35.2
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
sha256sums_x86_64=('b209f826a6f9c0829c7690bbaf7e4b2275761c8cfe482eb52081b169ed99dd53')
sha256sums_aarch64=('4d79415076808c821f4e7cba17fc080804dbac0cbd8da6f93dc1b71d98e3bd51')
sha256sums_i686=('592e8f79184661bdea7a56fbe39c5e7f78276d6762a549d0ccfe1d03d978e286')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"         "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "PATENTS-${pkgver}"   "${pkgdir}/usr/share/doc/${_pkgname}/PATENTS"
  install -vDm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
