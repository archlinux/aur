# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="protoc-gen-go"
pkgname="${_pkgname}-bin"
pkgver=1.35.1
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
sha256sums_x86_64=('b9415563e9e147b95f5d3573c92f9e25117a1ad0123cd0b6bd5e8590ea26bd7d')
sha256sums_aarch64=('53ae5ffcb106ad074d0b50cec3a3ded5d8757c4d82e9e78b3f55b85f7293ab39')
sha256sums_i686=('37164c7d1eb6d5c46a0604b4dbe5303ee9af0fe05a8fb0c972868943d1b0a04d')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}"         "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "PATENTS-${pkgver}"   "${pkgdir}/usr/share/doc/${_pkgname}/PATENTS"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
