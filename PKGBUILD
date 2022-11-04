# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=debezium-connector-postgres
pkgver=2.0.0.Final
pkgrel=1
pkgdesc='KafkaConnect plugin for PostgreSQL'
depends=('java-runtime>=8')
makedepends=('maven' 'java-environment>=8')
arch=('any')
source=("https://repo1.maven.org/maven2/io/debezium/debezium-connector-postgres/2.0.0.Final/${pkgname}-${pkgver}-plugin.tar.gz")
sha256sums=('3534c2c750084d8cb0f87c17220a2be032c7da062b3fec763b67abba12774545')


url='https://debezium.io/documentation/reference/2.0/connectors/postgresql.html'
license=('Apache')

package() {
  cd "${pkgname}"
  mkdir -p "${pkgdir}/usr/share/java/${pkgname}"
  cp *.jar "${pkgdir}/usr/share/java/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  cp CHANGELOG.md README.md "${pkgdir}/usr/share/doc/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/kafka/plugins"
  cd "${pkgdir}/usr/share/kafka/plugins"
  ln -s "../../java/${pkgname}" .
}
