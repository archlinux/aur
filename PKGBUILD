# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgbase=clickhouse-kafka-connect
pkgname=${pkgbase}-bin
pkgver=0.0.7
pkgrel=1
pkgdesc='official Kafka Connect sink connector for ClickHouse'
depends=('java-runtime>=11')
arch=('any')
source=("https://github.com/ClickHouse/clickhouse-kafka-connect/releases/download/v${pkgver}-beta/${pkgbase}-${pkgver}.zip")
sha256sums=('63e8c20925415fea344c081266a62035dc24bc6927686dbec30e81f450969398')

url='https://github.com/ClickHouse/clickhouse-kafka-connect'
license=('Apache')

package() {
  cd "${pkgbase}-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/java/${pkgbase}"
  cp lib/*.jar "${pkgdir}/usr/share/java/${pkgbase}"
  mkdir -p "${pkgdir}/usr/share/kafka/plugins"
  cd "${pkgdir}/usr/share/kafka/plugins"
  ln -s "../../java/${pkgbase}" .
}
