# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=milvus-backup-bin
pkgver=0.6.2
pkgrel=1
pkgdesc="Backup and restore tool for Milvus"
arch=('x86_64' 'aarch64')
url="https://github.com/zilliztech/milvus-backup"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/milvus-backup_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/milvus-backup_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('b8d46d25020370c34ee7091f9747adf929bfdb19dfeffc0097c96a1f3e76dd1a')
sha256sums_aarch64=('d8a071bcaa01d722b0a32958aaa2c588c3ad45cf45531c55546ecf8d3eb32324')

package() {
  install -Dm755 "milvus-backup" "${pkgdir}/usr/bin/milvus-backup"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
