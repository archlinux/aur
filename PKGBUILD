# Maintainer: Xunhua Guo <xunhua.guo@gmail.com>

pkgname=mariadb-jdbc
pkgver=4.0.0
pkgrel=1
pkgdesc="MariaDB Connector/J - Java library to connect to MariaDB and MySQL."
arch=('any')
url="https://mariadb.com/kb/en/mariadb-connector-j/"
license=("LGPL")
depends=('java-runtime')
provides=('mysql-jdbc')
source=("https://dlm.mariadb.com/4868805/Connectors/java/connector-java-${pkgver}/mariadb-java-client-${pkgver}.jar")
sha256sums=("bb1211dac59ef4c54b7a8ad4755a913d36d2e81b34ca1d4cb9ffa9d5633df01f")

package() {
    install -D -m755 \
	"${srcdir}/mariadb-java-client-${pkgver}.jar" \
	"${pkgdir}/usr/share/java/${pkgname}/mariadb-java-client-${pkgver}.jar"
    ln -s "/usr/share/java/${pkgname}/mariadb-java-client-${pkgver}.jar" \
	"${pkgdir}/usr/share/java/${pkgname}/mariadb-java-client.jar"
}
