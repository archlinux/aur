# Maintainer: Xunhua Guo <xunhua.guo@gmail.com>

pkgname=mariadb-jdbc
pkgver=2.5.4
pkgrel=1
pkgdesc="The official Java library (Connector/J) to connect to MariaDB and MySQL"
arch=('any')
url="https://downloads.mariadb.org/connector-java/"
license=('LGPL2.1')
depends=('java-runtime')
provides=('mysql-jdbc')
source=("https://downloads.mariadb.com/Connectors/java/connector-java-${pkgver}/mariadb-java-client-${pkgver}.jar")

sha256sums=("5fafee1aad82be39143b4bfb8915d6c2d73d860938e667db8371183ff3c8500a")

package() {
    install -D -m755 \
	"${srcdir}/mariadb-java-client-${pkgver}.jar" \
	"${pkgdir}/usr/share/java/${pkgname}/mariadb-java-client-${pkgver}.jar"
    ln -s "/usr/share/java/${pkgname}/mariadb-java-client-${pkgver}.jar" \
	"${pkgdir}/usr/share/java/${pkgname}/mariadb-java-client.jar"
}
