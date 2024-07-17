# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='httpx'
pkgname="${_pkgname}-bin"
pkgver=1.6.6
pkgrel=1
pkgdesc='Fast and multi-purpose HTTP toolkit'
arch=('x86_64' 'armv6h' 'aarch64')
url='https://github.com/projectdiscovery/httpx'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
install="${pkgname}.install"

source_x86_64=("${_pkgname}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
source_armv6h=("${_pkgname}-${pkgver}-armv6.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm.zip")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip")

sha256sums_x86_64=('d069a6bbcc0d6b3c5bedc0322f7b996b2587481ae69162b17941b67d7e42cd2d')
sha256sums_armv6h=('1d8d4333be37af664692711d204c3ce32580952e238533c566a028b54de51b4a')
sha256sums_aarch64=('68e3c7971e5790af123d3783c40bf556cbd0f71f64fc54470a7c1a11ccdc2158')

package() {
  install -Dvm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}-toolkit"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
