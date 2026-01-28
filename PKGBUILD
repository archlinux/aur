# Maintainer: minus <minus@mnus.de>
# Contributor: Artjom Simon <hello@artjomsimon.berlin>
# Contributor: William Di Luigi <williamdiluigi@gmail.com>

pkgname=flyway
pkgver=12.0.0
pkgrel=1
pkgdesc="Database migration utility written Java, supporting a wide range of databases"
arch=('any')
url="https://github.com/flyway/flyway"
license=('Apache-2.0')
depends=('java-environment>=17')
source=(https://github.com/flyway/flyway/releases/download/flyway-$pkgver/flyway-commandline-$pkgver-linux-x64.tar.gz)
sha512sums=('041ec522b2054952f715981910a9e29900255362ba37cdb75f3bf7edf606ec9e03789cc84ad5917ed467b4d7e7e78fc4ea2656330c7eb213fbbbcabba29e4e16')

package() {
  cd $srcdir

  install -d -m755 $pkgdir/opt
  mv $pkgname-$pkgver $pkgdir/opt/$pkgname

  install -d -m755 $pkgdir/usr/bin
  chmod 755 $pkgdir/opt/flyway/flyway
  ln -s /opt/$pkgname/flyway $pkgdir/usr/bin/flyway
}

# vim:set ts=2 sw=2 et:
