# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=debezium-connector-postgres
pkgver=2.3.1.Final
pkgrel=1
pkgdesc='KafkaConnect plugin for PostgreSQL'
depends=('java-runtime>=8')
arch=('any')
source=("https://repo1.maven.org/maven2/io/debezium/debezium-connector-postgres/${pkgver}/${pkgname}-${pkgver}-plugin.tar.gz")
sha256sums=('f0f8bbcc7b14f7a281a9c7456806e92455d6ec72b328370830490161c05ff84b')

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
