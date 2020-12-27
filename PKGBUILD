# Maintainer: Volker Schatz <arch@my-name-without-hyphen.com>
pkgname=alsacap
pkgver=0
pkgrel=2
pkgdesc="ALSA device capability lister"
depends=('alsa-lib')
arch=('i686' 'x86_64')
license=('custom:ISC')
url="https://www.volkerschatz.com/noise/alsa.html#alsacap"
source=("https://www.volkerschatz.com/noise/$pkgname.tgz")
md5sums=('7cfdec57e70a885d2a56e1364dfc80ba')

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
