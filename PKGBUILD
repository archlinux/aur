# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="deck"
pkgname="${_pkgname}-bin"
pkgver=1.46.1
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
b2sums_aarch64=('578b162f8e8d5c03f04bcfbde4a76bde5448d58eb2309945055be54d8c466d3d3c76bb9f7cbd52245ceaf297ae5441cdd89e198e1cfccae67c40ce7bc584f9a1')
b2sums_x86_64=('422ae8f1dd4453d70873371aebe57dd5f18017a6e8b8b102842f823451928ee4cb36ddfc855395c1f5a72e6b741f98688b1be2c3ea3889a88d331f031a99931e')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
