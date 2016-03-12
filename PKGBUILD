# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public@gmail.com>
# Contributor: barchiesi <dlbarchiesi at gmail dot com>
# Contributor: Sebastien Bariteau <numkem@gmail.com>
pkgname=mysql-connector-java
pkgver=5.1.38
pkgrel=1
pkgdesc="Java library to connect to MySQL"
depends=(java-environment)
arch=(any)
license=(GPL)
url="http://www.mysql.com/downloads/connector/j/"
source=(http://dev.mysql.com/Downloads/Connector-J/mysql-connector-java-${pkgver}.tar.gz)
sha256sums=('fa6232a0bcf67dc7d9acac9dc58910644e50790cbd8cc2f854e2c17f91b2c224')
provides=('mysql-connector-java')

package() {
  cd "$srcdir"
  install -D -m644 $srcdir/mysql-connector-java-${pkgver}/mysql-connector-java-${pkgver}-bin.jar $pkgdir/usr/share/java/mysql-connector-java-${pkgver}-bin.jar

  # Install symlink for not requiring a specific version
  ln -sf /usr/share/java/mysql-connector-java-${pkgver}-bin.jar ${pkgdir}/usr/share/java/mysql-connector-java-bin.jar
}
