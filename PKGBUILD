# Contributor: Sergio Tridente <tioduke (at) gmail (dot) com> 

pkgname=jackrabbit
pkgver=2.20.9
pkgrel=1
pkgdesc="A fully conforming implementation of the Content Repository for Java Technology API"
arch=('any')
url="http://jackrabbit.apache.org/"
license=('APACHE')
depends=('java-environment>=8')
options=(!strip)
source=(http://www.apache.org/dist/$pkgname/$pkgver/$pkgname-standalone-$pkgver.jar)
sha512sums=('77be122d22393a6957c867e276b110a093f5f7c0c0685a0a397f3638cfd8b1d8c18088c5e03e37c910b62f9ea71d92ffb3ddb5ae95b75785b35590fa022b3aa6')
noextract=($pkgname-standalone-$pkgver.jar)

package() {
  mkdir -p $pkgdir/usr/share/java
  install -m644 $srcdir/$pkgname-standalone-$pkgver.jar $pkgdir/usr/share/java/
  ln -s $pkgname-standalone-$pkgver.jar $pkgdir/usr/share/java/$pkgname-standalone.jar
}
