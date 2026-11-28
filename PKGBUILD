# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mempool-dumpster-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="Dump mempool transactions to Parquet and CSV"
arch=('x86_64' 'aarch64')
url="https://github.com/flashbots/mempool-dumpster"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/mempool-dumpster_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/mempool-dumpster_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('ea060428a8c1b8bcfa49c224643db6722aba9b80cf356a27fb0d008fffdf623a')
sha256sums_aarch64=('c684518ff1c9bd306d1da086daf8aef200b4279781195660bfc4b41c3894e13d')

package() {
  install -Dm755 "mempool-dumpster" "${pkgdir}/usr/bin/mempool-dumpster"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
