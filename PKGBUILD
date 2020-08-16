# Maintainer: Xunhua Guo <xunhua.guo@gmail.com>

pkgname=mariadb-jdbc
pkgver=2.6.2
pkgrel=1
pkgdesc="The official Java library (Connector/J) to connect to MariaDB and MySQL"
arch=('any')
url="https://downloads.mariadb.org/connector-java/"
license=('LGPL2.1')
depends=('java-runtime')
provides=('mysql-jdbc')
source=("https://downloads.mariadb.com/Connectors/java/connector-java-${pkgver}/mariadb-java-client-${pkgver}.jar")

sha256sums=("f7263dd9c68168304603f3444f8cfeec00ae68eeed711271f4a377f977473d27")

package() {
    install -D -m755 \
	"${srcdir}/mariadb-java-client-${pkgver}.jar" \
	"${pkgdir}/usr/share/java/${pkgname}/mariadb-java-client-${pkgver}.jar"
    ln -s "/usr/share/java/${pkgname}/mariadb-java-client-${pkgver}.jar" \
	"${pkgdir}/usr/share/java/${pkgname}/mariadb-java-client.jar"
}
