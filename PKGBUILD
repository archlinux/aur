# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>
# Contributor: barchiesi <dlbarchiesi at gmail dot com>
# Contributor: Sebastien Bariteau <numkem@gmail.com>

pkgname=mysql-connector-java
pkgver=8.0.11
pkgrel=1
pkgdesc="Java library to connect to MySQL"
depends=(java-environment)
arch=(any)
license=(GPL,custom)
url="http://www.mysql.com/downloads/connector/j/"
source=(http://dev.mysql.com/Downloads/Connector-J/mysql-connector-java-${pkgver}.tar.gz)
sha512sums=('4e9d17f6c79ce0bf9a4d66e6543ce7974b225b2228314ec37a9db3896812d134d047cb65970106d3f212577163cdc2b56010eac773478721132bb647f9492c16')

package() {
  cd "$srcdir/mysql-connector-java-${pkgver}"
  install -Dm644 mysql-connector-java-${pkgver}.jar \
    $pkgdir/usr/share/java/mysql-connector-java-${pkgver}.jar

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses"

  # Install symlink for not requiring a specific version
  cd "${pkgdir}/usr/share/java"
  ln -sf mysql-connector-java-${pkgver}.jar \
    mysql-connector-java.jar

}
