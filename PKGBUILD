# Maintainer: minus <minus@mnus.de>
# Contributor: Artjom Simon <hello@artjomsimon.berlin>
# Contributor: William Di Luigi <williamdiluigi@gmail.com>

pkgname=flyway
pkgver=12.6.2
pkgrel=1
pkgdesc="Database migration utility written Java, supporting a wide range of databases"
arch=('any')
url="https://github.com/flyway/flyway"
license=('Apache-2.0')
depends=('java-environment>=17')
source=(https://github.com/flyway/flyway/releases/download/flyway-$pkgver/flyway-commandline-$pkgver-linux-x64.tar.gz)
sha512sums=('8c2606fe993633af254bf27ac24b4baab8ea66145d802fc6237d61112d68fd3fac1f91265b5006ffdbfb219fdfbc90033876bdf9f7148d44597fa2dc779fa0f6')

package() {
  cd $srcdir

  install -d -m755 $pkgdir/opt
  mv $pkgname-$pkgver $pkgdir/opt/$pkgname

  install -d -m755 $pkgdir/usr/bin
  chmod 755 $pkgdir/opt/flyway/flyway
  ln -s /opt/$pkgname/flyway $pkgdir/usr/bin/flyway
}

# vim:set ts=2 sw=2 et:
