# Maintainer: minus <minus@mnus.de>
# Contributor: Artjom Simon <hello@artjomsimon.berlin>
# Contributor: William Di Luigi <williamdiluigi@gmail.com>

pkgname=flyway
pkgver=11.3.4
pkgrel=1
pkgdesc="Database migration utility written Java, supporting a wide range of databases"
arch=('any')
url="https://flywaydb.org/"
license=('Apache')
depends=('java-environment>=17')
source=(https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/$pkgver/flyway-commandline-$pkgver.tar.gz)
sha512sums=('b5aeb2a39d9ad957c86647779e038f7fe9ca96db1ee4c36cce3a0387bef789abe2e0dcdb8afa53cb611ecedb47d52574fb3e0868731bee04af342e93a722e166')

package() {
  cd $srcdir

  install -d -m755 $pkgdir/opt
  mv $pkgname-$pkgver $pkgdir/opt/$pkgname

  install -d -m755 $pkgdir/usr/bin
  chmod 755 $pkgdir/opt/flyway/flyway
  ln -s /opt/$pkgname/flyway $pkgdir/usr/bin/flyway
}

# vim:set ts=2 sw=2 et:
