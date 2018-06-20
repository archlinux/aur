# Maintainer: Xunhua Guo <xunhua.guo@gmail.com>

pkgname=mariadb-jdbc
pkgver=2.2.5
pkgrel=2
pkgdesc="The official JDBC driver (Java library) for MariaDB"
arch=('any')
url="https://downloads.mariadb.org/connector-java/"
license=('LGPL2.1')
depends=('java-runtime')
provides=('mysql-jdbc')
replaces=('mysql-jdbc')
source=("https://downloads.mariadb.com/Connectors/java/connector-java-${pkgver}/mariadb-java-client-${pkgver}.jar")

sha256sums=("9057e0ce8305ac52a2ac0161fc38286d5eef02ef4d85d9e164b1c3e3f3c275d2")

package() {
    install -D -m755 \
	"${srcdir}/mariadb-java-client-${pkgver}.jar" \
	"${pkgdir}/usr/share/java/${pkgname}/mariadb-java-client-${pkgver}.jar"
    ln -s "/usr/share/java/${pkgname}/mariadb-java-client-${pkgver}.jar" \
	"${pkgdir}/usr/share/java/${pkgname}/mariadb-java-client.jar"
}
