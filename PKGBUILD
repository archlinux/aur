# Maintainer: envolution
# Contributor: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>
# Contributor: barchiesi <dlbarchiesi at gmail dot com>
# Contributor: Sebastien Bariteau <numkem@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=mysql-connector-java
pkgver=9.4.0
pkgrel=1
pkgdesc="Java library to connect to MySQL"
depends=(java-environment)
arch=(any)
license=(GPL-2.0-or-later)
url='https://dev.mysql.com/downloads/connector/j/'
source=(
  https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-j-${pkgver}.tar.gz
)
sha512sums=('57db259a45b6b060c93f8252d5e9d1998534033db9b0ade8409bb72890701017d411482c8b11eb25c84d18bf8301c57ca200177b2e3e019f1be32e17304bc2fd')

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
