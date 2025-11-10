# Maintainer: minus <minus@mnus.de>
# Contributor: Artjom Simon <hello@artjomsimon.berlin>
# Contributor: William Di Luigi <williamdiluigi@gmail.com>

pkgname=flyway
pkgver=11.16.0
pkgrel=1
pkgdesc="Database migration utility written Java, supporting a wide range of databases"
arch=('any')
url="https://github.com/flyway/flyway"
license=('Apache-2.0')
depends=('java-environment>=17')
source=(https://github.com/flyway/flyway/releases/download/flyway-$pkgver/flyway-commandline-$pkgver-linux-x64.tar.gz)
sha512sums=('ba6c74fe5b26a4da1c04c52a88d4b6daf8fa3093cdca7bd7c6aa876ce239f39729f760810347e52ad48c73eb0339796559254247114bf058a4d573f88ae11030')

package() {
  cd $srcdir

  install -d -m755 $pkgdir/opt
  mv $pkgname-$pkgver $pkgdir/opt/$pkgname

  install -d -m755 $pkgdir/usr/bin
  chmod 755 $pkgdir/opt/flyway/flyway
  ln -s /opt/$pkgname/flyway $pkgdir/usr/bin/flyway
}

# vim:set ts=2 sw=2 et:
