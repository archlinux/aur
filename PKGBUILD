# Contributor: Sergio Tridente <tioduke (at) gmail (dot) com> 

pkgname=jackrabbit
pkgver=2.20.16
pkgrel=1
pkgdesc="A fully conforming implementation of the Content Repository for Java Technology API"
arch=('any')
url="http://jackrabbit.apache.org/"
license=('APACHE')
depends=('java-environment>=8')
options=(!strip)
source=(http://www.apache.org/dist/$pkgname/$pkgver/$pkgname-standalone-$pkgver.jar)
sha512sums=('be2bdbe8b110d2744fe998d5a622e3957c4bdbb093b51a50447b8a5f91c45f3606d432fcd223ebc5bc7ec1c58abad035b2030e2535694d817ba2ef7d32c5be85')
noextract=($pkgname-standalone-$pkgver.jar)

package() {
  mkdir -p $pkgdir/usr/share/java
  install -m644 $srcdir/$pkgname-standalone-$pkgver.jar $pkgdir/usr/share/java/
  ln -s $pkgname-standalone-$pkgver.jar $pkgdir/usr/share/java/$pkgname-standalone.jar
}
