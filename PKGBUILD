# Maintainer: Marti Raudsepp <marti@juffo.org>

pkgname=apgdiff
pkgver=2.4
pkgrel=1
pkgdesc="Another PostgreSQL Diff Tool for schema comparison and migration"
url="http://apgdiff.startnet.biz/"
depends=('java-runtime')
arch=('any')
license=('MIT')
source=(http://apgdiff.startnet.biz/download/$pkgname-$pkgver-bin.zip)

build() {
  mkdir -p $pkgdir/usr/bin $pkgdir/usr/share/$pkgname \
    $pkgdir/usr/share/licenses/$pkgname

  cd $srcdir/$pkgname-$pkgver
  install -m644 $pkgname-$pkgver.jar $pkgdir/usr/share/$pkgname/$pkgname.jar
  install -m644 license.txt $pkgdir/usr/share/licenses/$pkgname/

  # Script to invoke apgdiff
  echo "#!/bin/sh" > $pkgdir/usr/bin/$pkgname
  echo "exec \$JAVA_HOME/bin/java -jar /usr/share/$pkgname/$pkgname.jar \$@" >> $pkgdir/usr/bin/$pkgname
  chmod 755 $pkgdir/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
md5sums=('4e4c248fd041b6e58cc5d1e2e3d9ce37')
