# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname="vulnx"
pkgname="${_pkgname}-bin"
pkgver=2.0.0
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

sha256sums_aarch64=('307e28dec497fcf500fb129d99d85fe6dba4a5045814c75e92c2f804fda89b3d')
sha256sums_armv7h=('4ac8806ac84a5ff0d0a56024e1814893508a711cd3d1be393f4a4882133ae367')
sha256sums_i686=('3e628b52bdac2249c59f53edc19aa92e75832349657de183a119f4105a57b539')
sha256sums_x86_64=('35c79881f5db04b7d50a66b6543bd80df5c7cd527daed56a432d8c8d3a107488')

package() {
  cd "${srcdir}"

  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
