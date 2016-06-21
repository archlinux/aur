# Maintainer: Xunhua Guo <xunhua.guo@gmail.com>

pkgname=mariadb-jdbc
pkgver=1.4.6
pkgrel=1
pkgdesc="The official JDBC driver (Java library) for MariaDB"
arch=('any')
url="https://downloads.mariadb.org/client-java/"
license=('LGPL2.1')
depends=('java-runtime')
provides=('mysql-jdbc')
#conflicts=('mysql-jdbc')
replaces=('mysql-jdbc')
source=("https://code.mariadb.com/connectors/java/connector-java-${pkgver}/mariadb-java-client-${pkgver}.jar")
md5sums=("c7dda38e69e4e79450d95069b152300d")

package() {
    install -D -m755 \
	"${srcdir}/mariadb-java-client-${pkgver}.jar" \
	"${pkgdir}/usr/share/java/${pkgname}/mariadb-java-client-${pkgver}.jar"
    ln -s "/usr/share/java/${pkgname}/mariadb-java-client-${pkgver}.jar" \
	"${pkgdir}/usr/share/java/${pkgname}/mariadb-java-client.jar"
}
