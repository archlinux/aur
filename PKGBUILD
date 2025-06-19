# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="deck"
pkgname="${_pkgname}-bin"
pkgver=1.49.0
pkgrel=1
pkgdesc="Configuration management and drift detection for Kong and Kong Enterprise"
arch=('aarch64' 'x86_64')
url="https://github.com/Kong/${_pkgname}"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.tar.gz")
b2sums_aarch64=('165a5dd895a95810dd3c2c549becf97f1ecce2dff89339be9adb5041ed08d37dee7d018b64e1d473f830c4060b5bf2daea4da1f35212960dd32e4f56ee11d95e')
b2sums_x86_64=('ca1894f7993adb7a0daadf9bb246b07702d3a22b50b39b5c94295139ec1a878ef1b8c9f61db7678d699d4d53db5430ffaee67aa3cbabcc1d46cc37d906f2c9a6')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
