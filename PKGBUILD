# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=solace-nisshi-bin
pkgver=0.8.2
pkgrel=1
pkgdesc="Apache Kafka compatible broker with S3, PostgreSQL, SQLite, Apache Iceberg and Delta Lake"
arch=('x86_64' 'aarch64')
url="https://github.com/nisshi-io/solace-nisshi"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/nisshi-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/nisshi-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('36c92a399f2fa8a777488977c7d3fee5b1a51a385cdb7149a1ea96f0ecb58664')
sha256sums_aarch64=('09f4012b7742d5892cc567ad641105e145d4b9857f5cf6eab7efdd346bc9905e')

package() {
  install -Dm755 "./bin/nisshi" "${pkgdir}/usr/bin/nisshi"
  install -Dm644 "./LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "./README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
