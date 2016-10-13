# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>
# Contributor: barchiesi <dlbarchiesi at gmail dot com>
# Contributor: Sebastien Bariteau <numkem@gmail.com>
pkgname=mysql-connector-java
pkgver=5.1.40
pkgrel=1
pkgdesc="Java library to connect to MySQL"
depends=(java-environment)
arch=(any)
license=(GPL)
url="http://www.mysql.com/downloads/connector/j/"
source=(http://dev.mysql.com/Downloads/Connector-J/mysql-connector-java-${pkgver}.tar.gz)
sha512sums=('a9682066c5c6b6869315415848f7054b9c607c1636bf30fd87732e8e141bafd31dd9136aa76f21c0c8c5f2e12a65a76f30a4e4778dbafb52cbaa5d5baf6186db')

package() {
  cd "$srcdir/mysql-connector-java-${pkgver}"
  install -D -m644 mysql-connector-java-${pkgver}-bin.jar \
    $pkgdir/usr/share/java/mysql-connector-java-${pkgver}-bin.jar

  # Install symlink for not requiring a specific version
  cd "${pkgdir}/usr/share/java"
  ln -sf mysql-connector-java-${pkgver}-bin.jar \
    mysql-connector-java-bin.jar
}
