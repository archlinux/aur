# Maintainer: envolution
# Contributor: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>
# Contributor: barchiesi <dlbarchiesi at gmail dot com>
# Contributor: Sebastien Bariteau <numkem@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=mysql-connector-java
pkgver=9.2.0
pkgrel=1
pkgdesc="Java library to connect to MySQL"
depends=(java-environment)
arch=(any)
license=(GPL-2.0-or-later)
url='https://dev.mysql.com/downloads/connector/j/'
source=(
  https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-j-${pkgver}.tar.gz
)
sha512sums=('31a32cbb026932c3ec08c5a6f24643db084b3bf43d28e11b94bbccb5478b66f69322819dd611daa7b2ba0b705fba00d3a7ba2ce6d96f023cf4e2b0ae4457ba6a')

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
