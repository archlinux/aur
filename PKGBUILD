# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pgcapture-bin
pkgver=0.0.70
pkgrel=1
pkgdesc="Scalable change data capture for PostgreSQL"
arch=('x86_64')
url="https://github.com/replicase/pgcapture"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/replicase/pgcapture/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/pgcapture-linux-amd64")
sha256sums=('43070e2d4e532684de521b885f385d0841030efa2b1a20bafb76133a5e1379c1')
sha256sums_x86_64=('af20eb75f21d3a7f16b1c92c5e6cd31de797196e7af611d5edd8575f7d805248')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/pgcapture"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
