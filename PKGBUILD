# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="kyanos"
pkgname="${_pkgname}-bin"
pkgver=1.5.0
pkgrel=1
pkgdesc="Visualize the time packets spend in the kernel, watch & analyze in command line"
arch=('aarch64' 'x86_64')
url="https://kyanos.io"
_url="https://github.com/hengyoush/${_pkgname}"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.tar.gz")
b2sums_aarch64=('357eb4d96172582da658fed06377d8653ce75e0cbb839dca29fd695186bc7aae6ab34e6733b485ed9fd9c3e84ce9b1cb649361776f2c4e0167095f775fda63f4')
b2sums_x86_64=('29b51a9b92d75e2f9ea3d96d888df9aa1557468ecd2531fdb4a55f4c8e58f008f36a770e05409665e7f9d632f040dfdfb77a9bb8c6d0e6a6d6cf6b1c14daad34')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "README_CN.md" "${pkgdir}/usr/share/doc/${_pkgname}/README_CN.md"
  install -vDm644 "LICENSE"      "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
