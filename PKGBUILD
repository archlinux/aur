# Maintainer: Xunhua Guo <xunhua.guo@gmail.com>

pkgname=mariadb-jdbc
pkgver=2.4.1
pkgrel=1
pkgdesc="The official Java library (Connector/J) to connect to MariaDB and MySQL"
arch=('any')
url="https://downloads.mariadb.org/connector-java/"
license=('LGPL2.1')
depends=('java-runtime')
provides=('mysql-jdbc')
source=("https://downloads.mariadb.com/Connectors/java/connector-java-${pkgver}/mariadb-java-client-${pkgver}.jar")

sha256sums=("73a0614b81b6b1af62742f1f25a83b6e5d27ec67a57dfc7bf4d52db70b7abf34")

package() {
    install -D -m755 \
	"${srcdir}/mariadb-java-client-${pkgver}.jar" \
	"${pkgdir}/usr/share/java/${pkgname}/mariadb-java-client-${pkgver}.jar"
    ln -s "/usr/share/java/${pkgname}/mariadb-java-client-${pkgver}.jar" \
	"${pkgdir}/usr/share/java/${pkgname}/mariadb-java-client.jar"
}
