# Contributor: Sergio Tridente <tioduke (at) gmail (dot) com> 

pkgname=jackrabbit
pkgver=2.20.10
pkgrel=1
pkgdesc="A fully conforming implementation of the Content Repository for Java Technology API"
arch=('any')
url="http://jackrabbit.apache.org/"
license=('APACHE')
depends=('java-environment>=8')
options=(!strip)
source=(http://www.apache.org/dist/$pkgname/$pkgver/$pkgname-standalone-$pkgver.jar)
sha512sums=('5d3f486741ced9ce6bd2c5831cf0e0a61531e655eef3395c2214484daf6e2b57772af270ef85f194716605c00903276206a8657e71322ef4e79c4c39c5180267')
noextract=($pkgname-standalone-$pkgver.jar)

package() {
  mkdir -p $pkgdir/usr/share/java
  install -m644 $srcdir/$pkgname-standalone-$pkgver.jar $pkgdir/usr/share/java/
  ln -s $pkgname-standalone-$pkgver.jar $pkgdir/usr/share/java/$pkgname-standalone.jar
}
