# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname="vulnx"
pkgname="${_pkgname}-bin"
pkgver=1.0.0
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
sha256sums_aarch64=('48d5bc9ec7ef6dd1f2ae73b031f80c1d34d83af438f5e3ebf4d98168d133924e')
sha256sums_armv7h=('e4a0f3717000746d1801aaea1475595ba2ed368806f0f16b106f6222fddae294')
sha256sums_i686=('9beaba7a76cbad4e9d51c7107851b8151761b9eb13c1f76737eeac6bc9772a26')
sha256sums_x86_64=('974078848469889dc253cd37a5bb00c352d67640be1467a88f6e69a77f965a24')

package() {
  cd "${srcdir}"

  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
