# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgbase=kafka-questdb-connector
pkgname=${pkgbase}-bin
pkgver=0.5
pkgrel=1
pkgdesc='KafkaConnect plugin for PostgreSQL'
depends=('java-runtime>=11')
arch=('any')
source=("https://github.com/questdb/kafka-questdb-connector/releases/download/v${pkgver}/kafka-questdb-connector-${pkgver}-bin.zip")
sha256sums=('c9d2a800777796f11b4f1ddc380d56c5b7893cf18311c223e3bd59e66a50ed49')

url='https://github.com/questdb/kafka-questdb-connector'
license=('Apache')

package() {
  cd "${pkgbase}"
  mkdir -p "${pkgdir}/usr/share/java/${pkgbase}"
  cp *.jar "${pkgdir}/usr/share/java/${pkgbase}"
  mkdir -p "${pkgdir}/usr/share/kafka/plugins"
  cd "${pkgdir}/usr/share/kafka/plugins"
  ln -s "../../java/${pkgbase}" .
}
