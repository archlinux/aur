# Maintainer: Volker Schatz <arch@my-name-without-hyphen.com>
pkgname=alsacap
pkgver=0
pkgrel=1
pkgdesc="ALSA device capability lister"
depends=('alsa-lib')
arch=('i686' 'x86_64')
license=('custom')
url="http://www.volkerschatz.com/noise/alsa.html#alsacap"
source=("http://www.volkerschatz.com/noise/$pkgname.tgz")
md5sums=('19642bdffd4666caa53344271aa585e9')

build() {
    cd "$srcdir/$pkgname"
    make
}
package() {
    cd "$srcdir/$pkgname"
    sed -i -e 's!/usr/local!'"$pkgdir/usr"! Makefile
    make install
    install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
