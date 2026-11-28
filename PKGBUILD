# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=honeytail-bin
pkgver=1.12.0
pkgrel=1
pkgdesc="Honeycomb log tailing agent"
arch=('x86_64' 'aarch64')
url="https://github.com/honeycombio/honeytail"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/honeycombio/honeytail/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/honeytail-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/honeytail-linux-arm64")
sha256sums=('b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1')
sha256sums_x86_64=('51d383918abb4454c095bc3e14fba8e85f52e74b1cf864875c259f064289f19e')
sha256sums_aarch64=('f5d78cc37aed291cc4fdecd965fe96b2de0122c76695e5af176be7e1e728b447')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/honeytail"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
