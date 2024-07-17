# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="protoc-gen-go"
pkgname="${_pkgname}-bin"
pkgver=1.34.2
pkgrel=1
pkgdesc="Go support for Google's protocol buffers"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/protocolbuffers/protobuf-go"
license=('BSD-3-Clause')
optdepends=('protobuf: protoc generator')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README.md-${pkgver}::${url}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE"
        "PATENTS-${pkgver}::${url}/raw/v${pkgver}/PATENTS")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}.v${pkgver}.linux.amd64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}.v${pkgver}.linux.386.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}.v${pkgver}.linux.arm64.tar.gz")
sha256sums=('12156774520d841d748bcd4acba1ad6b24952f2766ceb5e873c32653a9ab3a2e'
            '4835612df0098ca95f8e7d9e3bffcb02358d435dbb38057c844c99d7f725eb20'
            '96f408bfae65bf137fc2525d3ecb030271c50c1e90799f87abf8846d8dd505cc')
sha256sums_x86_64=('b87bc134dee55576a842141bf0ed27761c635d746780fce5dee038c6dd16554f')
sha256sums_i686=('a191849433fd489f1d44f37788d762658f3f5fb225f3a85d4ce6ba32666703ed')
sha256sums_aarch64=('63d400167e75ab9f6690688f6fdc6a9455aa20bc1faa71e32149dbd322f7f198')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}"         "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md-${pkgver}" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "PATENTS-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/PATENTS"
}
