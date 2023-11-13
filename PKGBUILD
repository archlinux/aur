# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='httpx'
pkgname="${_pkgname}-bin"
pkgver=1.3.7
pkgrel=2
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

sha256sums_x86_64=('6b4f0c2ba6c91581bb401bdfc0ef1756a20069f34b66413912046142a434ff46')
sha256sums_armv6h=('b82211972232c036ed5834770f8cbb40c04e24a3fbb9e615907dca0f94ee501c')
sha256sums_aarch64=('96c1776d776a3d5d5e875df965ba4c26b1540780f4e8717b76aeef165a4c653a')

package() {
  install -Dvm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}-toolkit"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
