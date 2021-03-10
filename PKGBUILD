# Maintainer: Xunhua Guo <xunhua.guo@gmail.com>

pkgname=mariadb-jdbc
pkgver=2.7.2
pkgrel=1
pkgdesc="The official Java library (Connector/J) to connect to MariaDB and MySQL"
arch=('any')
url="https://downloads.mariadb.org/connector-java/"
license=('LGPL2.1')
depends=('java-runtime')
provides=('mysql-jdbc')
source=("https://downloads.mariadb.com/Connectors/java/connector-java-${pkgver}/mariadb-java-client-${pkgver}.jar")

sha256sums=("a3f6776df0842cf65e7f158515012d5307da949f66042282e1ee4474dd19f448")

package() {
    install -D -m755 \
	"${srcdir}/mariadb-java-client-${pkgver}.jar" \
	"${pkgdir}/usr/share/java/${pkgname}/mariadb-java-client-${pkgver}.jar"
    ln -s "/usr/share/java/${pkgname}/mariadb-java-client-${pkgver}.jar" \
	"${pkgdir}/usr/share/java/${pkgname}/mariadb-java-client.jar"
}
