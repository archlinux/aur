# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgbase=clickhouse-kafka-connect
pkgname=${pkgbase}-bin
pkgver=0.0.8
pkgrel=1
pkgdesc='official Kafka Connect sink connector for ClickHouse'
depends=('java-runtime>=11')
arch=('any')
source=("https://github.com/ClickHouse/clickhouse-kafka-connect/releases/download/v${pkgver}-beta/${pkgbase}-${pkgver}.zip")
sha256sums=('e24714dd95047873b046f9755a507e3a54071a3816dc80d6db69693f74009fd3')

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
