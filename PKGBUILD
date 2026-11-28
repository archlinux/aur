# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=flate-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Inflate, validate and diff Flux resources"
arch=('x86_64' 'aarch64')
url="https://github.com/home-operations/flate"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/flate_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/flate_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('76940fb6ff060e09a40e1a835fc9c5cd24e18fdd29e4e79382852821e0ac01c2')
sha256sums_aarch64=('4ae502e56054ee9c5019995554856c1f6f8f44b3f6fef087704b2d31c27ab9c6')

package() {
  install -Dm755 "flate" "${pkgdir}/usr/bin/flate"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
