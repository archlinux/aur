# Maintainer: Xunhua Guo <xunhua.guo@gmail.com>

pkgname=mariadb-jdbc
pkgver=1.5.1
pkgrel=1
pkgdesc="The official JDBC driver (Java library) for MariaDB"
arch=('any')
url="https://downloads.mariadb.org/client-java/"
license=('LGPL2.1')
depends=('java-runtime')
provides=('mysql-jdbc')
#conflicts=('mysql-jdbc')
replaces=('mysql-jdbc')
source=("https://downloads.mariadb.com/enterprise/x18t-d36g/connectors/java/connector-java-${pkgver}/mariadb-java-client-${pkgver}-RC.jar")

md5sums=("900781f02010e966de0ce244d0286394")

package() {
    install -D -m755 \
	"${srcdir}/mariadb-java-client-${pkgver}-RC.jar" \
	"${pkgdir}/usr/share/java/${pkgname}/mariadb-java-client-${pkgver}-RC.jar"
    ln -s "/usr/share/java/${pkgname}/mariadb-java-client-${pkgver}-RC.jar" \
	"${pkgdir}/usr/share/java/${pkgname}/mariadb-java-client.jar"
}
