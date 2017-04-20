# Maintainer: Manuel Lladosa <manolollr@riseup.net>

pkgname=tickr
pkgver=0.6.4
pkgrel=3
pkgdesc="GTK-based highly graphically-customizable Feed Ticker"
arch=('i686' 'x86_64')
url="http://www.open-tickr.net/"
license=('gpl')
depends=('gdk-pixbuf2' 'gtk2' 'hicolor-icon-theme' 'libxml2')
makedepends=('gtk2' 'libxml2')
source=("http://www.open-tickr.net/src/tickr-0.6.4.tar.gz")
sha256sums=('8476fa8f539487c37617855b8312dbfaec322fe51fa5d9e9abe8c093caad75bd')

build() {
cd "${srcdir}/${pkgname}-${pkgver}"
./configure
make
}

package() {
cd "${srcdir}/${pkgname}-${pkgver}"
make DESTDIR="${pkgdir}" install
install -Dm644 $srcdir/$pkgname-$pkgver/README "$pkgdir/usr/share/doc/$pkgname/README"
install -Dm644 $srcdir/$pkgname-$pkgver/TODO "$pkgdir/usr/share/doc/$pkgname/TODO"
install -Dm644 $srcdir/$pkgname-$pkgver/tickr.desktop "$pkgdir/usr/share/applications/tickr.desktop"
install -Dm644 $srcdir/$pkgname-$pkgver/tickr-url-list "$pkgdir/usr/share/$pkgname/tickr-url-list"
install -Dm644 $srcdir/$pkgname-$pkgver/tickr.1 "$pkgdir/usr/share/man//man1/tickr.1"
}
