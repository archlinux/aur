# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="wush"
pkgname="${_pkgname}-bin"
pkgver=0.4.0
pkgrel=1
pkgdesc="Easily transfer files and open shells over a peer-to-peer WireGuard connection"
arch=('x86_64' 'aarch64' 'i686' 'armv7h')
url="https://github.com/coder/${_pkgname}"
license=('CC0-1.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
# source=("${_pkgsrc}.sha256::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_SHA256SUMS"
#         "${_pkgsrc}.sha256.sig::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_SHA256SUMS.sig")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_386.tar.gz")
source_armv7h=("${_pkgsrc}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_armv7.tar.gz")
sha256sums_x86_64=('85cbe276e55785eac7a95ba3e373b0cacfcc7ee19409b8641afe12978c0a98e0')
sha256sums_aarch64=('f52d120a97c4b8e4081f6839f1c1d641f626591d473d37d28fc22d88ec99efdd')
sha256sums_i686=('7ddd9c4b44a83674c8c8d513cbb519483bedda280fa7e6d38543d6927aea6532')
sha256sums_armv7h=('65e318a8b9d6f023f7f1f0b15c0d2b417630620c295ea9e51df9836330782b4f')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
