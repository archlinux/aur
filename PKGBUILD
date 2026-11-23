# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname="vulnx"
pkgname="${_pkgname}-bin"
pkgver=2.1.0
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

sha256sums_aarch64=('1d50eda75f965c0b9af08f30a7d2509b39d3368e3fbf602ba610e3b789aee87c')
sha256sums_armv7h=('44aeefe8d9eec505a796cf720a78a1ee8e645308c47808786dbabaa335bd767c')
sha256sums_i686=('9fb819dab38a359f928368550be3157d5eb361662f10fee7f1a84bb7184fe239')
sha256sums_x86_64=('91a49099d69d18362b6ee3be66776af33a827bad8cbe49e19076fc4536d815b8')

package() {
  cd "${srcdir}"

  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
