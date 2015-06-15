#! /bin/bash
# Contributor: Yonathan Dossow <ydossow@archlinux.cl>
# Maintainer: jorge_barroso <jorge.barroso.11@gmail.com>
pkgname=389-console
pkgver=1.1.7
pkgrel=4
pkgdesc="A Java based remote management console used for managing 389 Administration Server and 389 Directory Server."
arch=('any')
url="http://port389.org"
license=('GPL')
depends=('which' 'bash' 'idm-console-framework' 'java-runtime')
makedepends=('java-environment')
source=(http://directory.fedoraproject.org/sources/$pkgname-$pkgver.tar.bz2)
sha512sums=('d2ea4c65ea6bb01d3163271a44bb4fab4167863e2df1389e8d4bd2782083c33563ddfd232512d8b28f0de037a7cf0dd7ee554c1660d40fa50d731224748d9f6e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  /usr/share/apache-ant/bin/ant -Dbuilt.dir=`pwd`/built
} 

package(){

install -d $pkgdir/usr/share/java
install -m644 $srcdir/$pkgname-$pkgver/built/389-console-1.1.7_en.jar $pkgdir/usr/share/java
install -d $pkgdir/usr/bin
install -m755 $srcdir/$pkgname-$pkgver/built/$pkgname $pkgdir/usr/bin
}

# vim:set ts=2 sw=2 et:
