# Maintainer: minus <minus@mnus.de>
# Contributor: Artjom Simon <hello@artjomsimon.berlin>
# Contributor: William Di Luigi <williamdiluigi@gmail.com>

pkgname=flyway
pkgver=11.20.3
pkgrel=1
pkgdesc="Database migration utility written Java, supporting a wide range of databases"
arch=('any')
url="https://github.com/flyway/flyway"
license=('Apache-2.0')
depends=('java-environment>=17')
source=(https://github.com/flyway/flyway/releases/download/flyway-$pkgver/flyway-commandline-$pkgver-linux-x64.tar.gz)
sha512sums=('a171b901202c098dab4fc9d5e1e5aa5dc9554d32fde4653dbe76cb94eac815ecdb52a7c63179c24f7c868e0a824bb39c8b0534c9bcb9676c561457675ceff191')

package() {
  cd $srcdir

  install -d -m755 $pkgdir/opt
  mv $pkgname-$pkgver $pkgdir/opt/$pkgname

  install -d -m755 $pkgdir/usr/bin
  chmod 755 $pkgdir/opt/flyway/flyway
  ln -s /opt/$pkgname/flyway $pkgdir/usr/bin/flyway
}

# vim:set ts=2 sw=2 et:
