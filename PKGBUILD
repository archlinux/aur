# Maintainer: Xunhua Guo <xunhua.guo@gmail.com>

pkgname=mariadb-jdbc
pkgver=3.5.10
pkgrel=1
pkgdesc="MariaDB Connector/J - Java library to connect to MariaDB and MySQL."
arch=('any')
url="https://mariadb.com/kb/en/mariadb-connector-j/"
license=("LGPL")
depends=('java-runtime')
provides=('mysql-jdbc')
source=("https://dlm.mariadb.com/4787586/Connectors/java/connector-java-${pkgver}/mariadb-java-client-${pkgver}.jar")
sha256sums=("919b8c1c771d9ee3465811462f242c9543ab401e140c64988ddbf1d8abcb18b2")

package() {
    install -D -m755 \
	"${srcdir}/mariadb-java-client-${pkgver}.jar" \
	"${pkgdir}/usr/share/java/${pkgname}/mariadb-java-client-${pkgver}.jar"
    ln -s "/usr/share/java/${pkgname}/mariadb-java-client-${pkgver}.jar" \
	"${pkgdir}/usr/share/java/${pkgname}/mariadb-java-client.jar"
}
