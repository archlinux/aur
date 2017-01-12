# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=abcl
pkgver=1.4.0
pkgrel=2
pkgdesc="Full implementation of the Common Lisp language in the JVM"
arch=('any')
url="http://common-lisp.net/project/armedbear/"
license=('GPL')
depends=('sh' 'java-environment')
makedepends=('apache-ant' 'net-tools')
provides=('common-lisp')
source=("http://abcl.org/releases/$pkgver/$pkgname-src-$pkgver.tar.gz" abcl.sh)
md5sums=('b60d653d8c7065876ffe2e7e76f6e3fa'
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
