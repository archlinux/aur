# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname="vulnx"
pkgname="${_pkgname}-bin"
pkgver=2.0.2
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

sha256sums_aarch64=('13c5888dde027b84bd3b6cf69c36c87e1e7aad7e7159bdeeb576f4962dcc1d06')
sha256sums_armv7h=('3166005d127a1f5fe3b252c982f5ce5afeb625823439a3add6217fc9b46b5b09')
sha256sums_i686=('363c79bcc9ec24a03e347bc2d7579eb858af4197b4cfde0784a541149a415d51')
sha256sums_x86_64=('387abd1c42b0357e1d4257b54528fc38e1d0357b12f05ab12117a4c628a5aaf8')

package() {
  cd "${srcdir}"

  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
