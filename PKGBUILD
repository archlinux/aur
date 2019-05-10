# Maintainer: Manuel Lladosa <manolollr at riseup dot net>

pkgname=tickr
pkgver=0.6.4
pkgrel=5
pkgdesc="GTK-based highly graphically-customizable Feed Ticker"
arch=('i686' 'x86_64')
url="http://www.open-tickr.net/"
license=('gpl')
depends=('gtk2')
source=("http://www.open-tickr.net/src/$pkgname-$pkgver.tar.gz")
sha256sums=('8476fa8f539487c37617855b8312dbfaec322fe51fa5d9e9abe8c093caad75bd')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    install -Dm644 README TODO -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 tickr.desktop -t "$pkgdir/usr/share/applications"
    install -Dm644 tickr-url-list -t "$pkgdir/usr/share/$pkgname"
    install -Dm644 tickr.1 -t "$pkgdir/usr/share/man/man1"
}
