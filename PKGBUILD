# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=abcl
pkgver=1.3.3
pkgrel=1
pkgdesc="Full implementation of the Common Lisp language in the JVM"
arch=('any')
url="http://common-lisp.net/project/armedbear/"
license=('GPL')
depends=('sh' 'java-environment')
makedepends=('apache-ant' 'net-tools')
source=("http://abcl.org/releases/$pkgver/$pkgname-src-$pkgver.tar.gz" abcl.sh)
md5sums=('0ce3eeedd585a9e834c55b4b3a84bf76'
         'd51ffd115b32f9a47f849fc7630ced4f')

build() {
  cd "$srcdir/$pkgname-src-$pkgver"
  ant
}

package() {
  cd "$srcdir/$pkgname-src-$pkgver"
  install -Dm755 $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname
  install -Dm644 dist/$pkgname.jar $pkgdir/usr/share/java/$pkgname.jar
  install -Dm644 dist/$pkgname-contrib.jar \
    $pkgdir/usr/share/java/$pkgname-contrib.jar
}
