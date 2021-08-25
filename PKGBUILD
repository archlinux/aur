# Maintainer: Manuel Lladosa <manolollr at riseup dot net>

pkgname=tickr
pkgver=0.7.1
pkgrel=1
pkgdesc="GTK-based highly graphically-customizable Feed Ticker"
arch=('i686' 'x86_64')
url="http://www.open-tickr.net/"
license=('gpl')
depends=('gtk2')
source=("http://www.open-tickr.net/src/$pkgname-$pkgver.tar.gz")
sha256sums=('391529a115b820d5c2cac7b466facc4722b7f90e02ab0acd7350a8e97adcee58')

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
