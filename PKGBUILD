# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname="vulnx"
pkgname="${_pkgname}-bin"
pkgver=2.0.1
pkgrel=1
pkgdesc="Modern CLI for exploring vulnerability data with powerful search, filtering, and analysis capabilities"

arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://github.com/projectdiscovery/cvemap"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm.zip")
source_i686=("${_pkgname}-${pkgver}-i686.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.zip")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")

sha256sums_aarch64=('29d0fbb4842869601953e4e459e6a991b9c0a07dad82cbf7b50defbb7d315193')
sha256sums_armv7h=('d846351f787276dcf76b316048953348f302fb831c75470a1ea0febfe4f5213c')
sha256sums_i686=('3e4ab1fb373cf6fc033c15fe2cf670e9ab36291251dbabb4c4a185eaab7055d4')
sha256sums_x86_64=('e016eb3302c53d699a3af78e983ecec3695d6aed49ea21e36d4f6283de40567e')

package() {
  cd "${srcdir}"

  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
