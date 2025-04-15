# Maintainer: envolution
# Contributor: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>
# Contributor: barchiesi <dlbarchiesi at gmail dot com>
# Contributor: Sebastien Bariteau <numkem@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=mysql-connector-java
pkgver=9.3.0
pkgrel=1
pkgdesc="Java library to connect to MySQL"
depends=(java-environment)
arch=(any)
license=(GPL-2.0-or-later)
url='https://dev.mysql.com/downloads/connector/j/'
source=(
  https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-j-${pkgver}.tar.gz
)
sha512sums=('a1dfdbae99dd537b31798daf61a6794c131dee11955674b09fcdeebc43e20c8ac3d730fb12f2be505e9a20d9f50aeb41b03a8fc70f5822a87ba4a8e3d3f47786')

package() {
  cd "$srcdir/mysql-connector-j-${pkgver}"
  install -Dm644 mysql-connector-j-${pkgver}.jar \
    $pkgdir/usr/share/java/mysql-connector-j-${pkgver}.jar

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"

  cd "${pkgdir}/usr/share/java"
  ln -sf mysql-connector-j-${pkgver}.jar \
    mysql-connector-java.jar
  ln -sf mysql-connector-j-${pkgver}.jar \
    mysql-connector-j.jar
}
# vim:set ts=2 sw=2 et:
