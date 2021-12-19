# Contributor: Sergio Tridente <tioduke (at) gmail (dot) com> 

pkgname=jackrabbit
pkgver=2.20.4
pkgrel=1
pkgdesc="A fully conforming implementation of the Content Repository for Java Technology API"
arch=('any')
url="http://jackrabbit.apache.org/"
license=('APACHE')
depends=('java-environment>=8')
options=(!strip)
source=(http://www.apache.org/dist/$pkgname/$pkgver/$pkgname-standalone-$pkgver.jar)
sha512sums=('1bbf1553a730124b8b3a3197f96d2d21ee861eb0ea25f2e9c08dfa32dfc4dc4cc55aea33dcde2745ce1012ec9049913ba39b311607f10aa78670ab26e5b91e43')
noextract=($pkgname-standalone-$pkgver.jar)

package() {
  mkdir -p $pkgdir/usr/share/java
  install -m644 $srcdir/$pkgname-standalone-$pkgver.jar $pkgdir/usr/share/java/
  ln -s $pkgname-standalone-$pkgver.jar $pkgdir/usr/share/java/$pkgname-standalone.jar
}
