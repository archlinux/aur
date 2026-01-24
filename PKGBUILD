# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='httpx'
pkgname="${_pkgname}-bin"
pkgver=1.8.1
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

sha256sums_x86_64=('fe21117f19886b9b5f66ed6445e296993371be25641ecf0a43947a788b2714bf')
sha256sums_armv6h=('d7911bada443340f2d2565aaa3164ef6bfb8d58a78666e2d237909b7bfb1b65a')
sha256sums_aarch64=('3a8c495fa7b6d95bfc484796368c055766dd701d21c721ff8b1fb54ca5dea6e6')

package() {
  install -Dvm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}-toolkit"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
