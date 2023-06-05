# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=debezium-connector-postgres
pkgver=2.2.1.Final
pkgrel=1
pkgdesc='KafkaConnect plugin for PostgreSQL'
depends=('java-runtime>=8')
arch=('any')
source=("https://repo1.maven.org/maven2/io/debezium/debezium-connector-postgres/${pkgver}/${pkgname}-${pkgver}-plugin.tar.gz")
sha256sums=('b2bb1265da5f76e92c7c8400fd3b8b69fdbcac20f733ec1a2ef8d253e4c8f2d2')

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
