# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='httpx'
pkgname="${_pkgname}-bin"
pkgver=1.2.9
pkgrel=1
pkgdesc='Fast and multi-purpose HTTP toolkit'
arch=('x86_64' 'armv6h' 'aarch64')
url='https://github.com/projectdiscovery/httpx'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')

source_x86_64=("${_pkgname}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
source_armv6h=("${_pkgname}-${pkgver}-armv6.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.zip")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip")

sha256sums_x86_64=('eb9e0a4959ce3d67af17ba3763485bd9ef1822b8907f22cc8ed1405b4b99bf6a')
sha256sums_armv6h=('95a98413264b9f1bfc5317af9499e32ce414ba06a51b7980c3d9a16a3e9c8f82')
sha256sums_aarch64=('c2c95ba3b662d52eca35c71d1e17113bf02a127aaa00a8df1a4950dc5de43927')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
