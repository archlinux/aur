# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=clickhouse-bulk-bin
pkgver=1.4.2
pkgrel=1
pkgdesc="Collect many small ClickHouse inserts and send them in big batches"
arch=('x86_64' 'aarch64')
url="https://github.com/nikepan/clickhouse-bulk"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/clickhouse-bulk_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/clickhouse-bulk_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('0c55d78cedf96dfb77ab6fe9ebd34d0ed969c36b93994d115644b7e59de6d4d6')
sha256sums_aarch64=('696f8de6a16378c1a9d596fc1a14398524c4808b1e990adb75b9d10915ab1ad3')

package() {
  install -Dm755 "clickhouse-bulk" "${pkgdir}/usr/bin/clickhouse-bulk"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
