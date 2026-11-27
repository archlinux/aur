# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=contexere-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="One place for the skills, keys and memory of every AI agent you use"
arch=('x86_64' 'aarch64')
url="https://github.com/fajarhide/contexere"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/fajarhide/contexere/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/contexere-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/contexere-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('5683cd57fe20f902948e310df14d0bfee121c39932fab068ad6eea0ce018b4d7')
sha256sums_aarch64=('05a9c43da378eb40d208a79667ce69c037dc363b134c5b9ceea9442401fa9979')

package() {
  install -Dm755 "contexere" "${pkgdir}/usr/bin/contexere"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
