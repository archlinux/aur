# Maintainer: envolution
# Contributor: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>
# Contributor: barchiesi <dlbarchiesi at gmail dot com>
# Contributor: Sebastien Bariteau <numkem@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=mysql-connector-java
pkgver=9.1.0
pkgrel=1
pkgdesc="Java library to connect to MySQL"
depends=(java-environment)
arch=(any)
license=(GPL-2.0-or-later)
url='https://dev.mysql.com/downloads/connector/j/'
source=(
  https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-j-${pkgver}.tar.gz
)
sha512sums=('042aa06fc5fb84d33b8308731371a29199a68bac5ae0866729fb2881f1bd4f41141f355c56c24764f2084059d99da56d9bba35d6ce3b48d9286bd1294d84ac02')

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
