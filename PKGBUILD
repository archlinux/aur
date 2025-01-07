# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="wush"
pkgname="${_pkgname}-bin"
pkgver=0.4.1
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
sha256sums_x86_64=('cb04d34e48f08597e0274c2d27041e93f852a8b3fa2113fe6868e157883e7c3b')
sha256sums_aarch64=('f85ac301e2020268cb68a03f5f288c3cfc79ef043c03a69df81156344f0a957f')
sha256sums_i686=('a490a8824a821653eba0d0f182e964df519e33cd5dab59a20c27e5db66e2a15f')
sha256sums_armv7h=('cb7773de4495dff66f426f6d3bdf35c0c08ca630b5b0faadf8030567d1ab1796')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
