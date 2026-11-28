# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=incert-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Add CA certificates into container images"
arch=('x86_64' 'aarch64')
url="https://github.com/chainguard-dev/incert"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/chainguard-dev/incert/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/incert-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/incert-linux-arm64")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('3823dd3e8a2c462fa7dcf96928d3da3973d9a051b8db4daf15d673c22fe43ddc')
sha256sums_aarch64=('9fb88d103ac9b011117134106e5035e9f30648d4d88bf3fab57204f3f3d552f3')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/incert"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
