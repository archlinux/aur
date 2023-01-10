# Contributor: Sergio Tridente <tioduke (at) gmail (dot) com> 

pkgname=jackrabbit
pkgver=2.20.8
pkgrel=1
pkgdesc="A fully conforming implementation of the Content Repository for Java Technology API"
arch=('any')
url="http://jackrabbit.apache.org/"
license=('APACHE')
depends=('java-environment>=8')
options=(!strip)
source=(http://www.apache.org/dist/$pkgname/$pkgver/$pkgname-standalone-$pkgver.jar)
sha512sums=('409fe9be6dcaa6c8ea074e2f7e4f7d72888208a9d70376abd3769b4c0f742f905222f20b95166a56f028b0e5c14b7b644e969e58244bd68cb29c8d24e2a0d493')
noextract=($pkgname-standalone-$pkgver.jar)

package() {
  mkdir -p $pkgdir/usr/share/java
  install -m644 $srcdir/$pkgname-standalone-$pkgver.jar $pkgdir/usr/share/java/
  ln -s $pkgname-standalone-$pkgver.jar $pkgdir/usr/share/java/$pkgname-standalone.jar
}
