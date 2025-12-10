# Maintainer: minus <minus@mnus.de>
# Contributor: Artjom Simon <hello@artjomsimon.berlin>
# Contributor: William Di Luigi <williamdiluigi@gmail.com>

pkgname=flyway
pkgver=11.19.0
pkgrel=1
pkgdesc="Database migration utility written Java, supporting a wide range of databases"
arch=('any')
url="https://github.com/flyway/flyway"
license=('Apache-2.0')
depends=('java-environment>=17')
source=(https://github.com/flyway/flyway/releases/download/flyway-$pkgver/flyway-commandline-$pkgver-linux-x64.tar.gz)
sha512sums=('2997e75825ad2ad64916cec0bcdc3bc4fdd5f69ceed37e0a34ee9c3a67fb87a77a933a3f8fab4537d29150f08b36a5983506e0108ed7e6c40418dad6dc76fa07')

package() {
  cd $srcdir

  install -d -m755 $pkgdir/opt
  mv $pkgname-$pkgver $pkgdir/opt/$pkgname

  install -d -m755 $pkgdir/usr/bin
  chmod 755 $pkgdir/opt/flyway/flyway
  ln -s /opt/$pkgname/flyway $pkgdir/usr/bin/flyway
}

# vim:set ts=2 sw=2 et:
