# Maintainer: Xunhua Guo <xunhua.guo@gmail.com>

pkgname=mariadb-jdbc
pkgver=3.5.7
pkgrel=1
pkgdesc="MariaDB Connector/J - Java library to connect to MariaDB and MySQL."
arch=('any')
url="https://mariadb.com/kb/en/mariadb-connector-j/"
license=("LGPL")
depends=('java-runtime')
provides=('mysql-jdbc')
source=("https://dlm.mariadb.com/4550269/Connectors/java/connector-java-${pkgver}/mariadb-java-client-${pkgver}.jar")

sha256sums=("07bb1229dc184f3313a5aef4c5a6b3207c8dbaa09db4a26814c936f004b4c526")

package() {
    install -D -m755 \
	"${srcdir}/mariadb-java-client-${pkgver}.jar" \
	"${pkgdir}/usr/share/java/${pkgname}/mariadb-java-client-${pkgver}.jar"
    ln -s "/usr/share/java/${pkgname}/mariadb-java-client-${pkgver}.jar" \
	"${pkgdir}/usr/share/java/${pkgname}/mariadb-java-client.jar"
}
