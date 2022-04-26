# Maintainer: Xunhua Guo <xunhua.guo@gmail.com>

pkgname=mariadb-jdbc
pkgver=3.0.4
pkgrel=1
pkgdesc="MariaDB Connector/J - Java library to connect to MariaDB and MySQL."
arch=('any')
url="https://mariadb.com/kb/en/mariadb-connector-j/"
license=('LGPL2.1')
depends=('java-runtime')
provides=('mysql-jdbc')
source=("https://downloads.mariadb.com/Connectors/java/connector-java-${pkgver}/mariadb-java-client-${pkgver}.jar")

sha256sums=("c8c9eba4f5368e3fdb321e17353446cbf8d36c822ec604841308b1bef950a529")

package() {
    install -D -m755 \
	"${srcdir}/mariadb-java-client-${pkgver}.jar" \
	"${pkgdir}/usr/share/java/${pkgname}/mariadb-java-client-${pkgver}.jar"
    ln -s "/usr/share/java/${pkgname}/mariadb-java-client-${pkgver}.jar" \
	"${pkgdir}/usr/share/java/${pkgname}/mariadb-java-client.jar"
}
