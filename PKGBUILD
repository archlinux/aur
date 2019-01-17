# Maintainer: Volker Schatz <arch@my-name-without-hyphen.com>
pkgname=myrescue
pkgver=0.9.8
pkgrel=1
pkgdesc="A hard disk recovery tool that reads undamaged regions first"
depends=()
arch=('i686' 'x86_64')
license=('GPL')
url="http://myrescue.sourceforge.net/"
source=(
    "http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
sha1sums=('fc605fc8559bff7296081131faee94d5103f3933')

build() {
#    cd "$srcdir/$pkgname-$pkgver/src"
    cd "$srcdir/src"
    make
}
package() {
#    cd "$srcdir/$pkgname-$pkgver"
    cd "$srcdir"
    install -D -m 755 src/myrescue "$pkgdir"/usr/bin/myrescue
    install -D -m 644 doc/myrescue.1 "$pkgdir"/usr/share/man/man1/myrescue.1
}
