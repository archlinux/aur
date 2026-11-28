# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=go-crond-bin
pkgver=26.10.0
pkgrel=1
pkgdesc="Cron daemon for containers"
arch=('x86_64' 'aarch64')
url="https://github.com/webdevops/go-crond"
license=('GPL-2.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/webdevops/go-crond/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/go-crond.linux.amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/go-crond.linux.arm64")
sha256sums=('c03cea027b4b40e4402fabd08557736727ec3d5bc54ad64ab6472de432198cad')
sha256sums_x86_64=('deb5f21917ff988570741e929d3e10c0476fe68142637b332e4312a98a37ef1a')
sha256sums_aarch64=('4a1c107d3d36858e86b9ac861a10e5397e1da345d79b216237bcf2f17a583c44')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/go-crond"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
