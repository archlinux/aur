# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Taylor Lookabaugh <jesus.christ.i.love@gmail.com>
# Contributor: Simo Leone <simo@archlinux.org>

pkgname=libticonv
pkgver=1.1.5
pkgrel=1
pkgdesc="TI character set conversion library"
arch=(i686 x86_64)
url=http://lpg.ticalc.org/prj_tilp/
license=(GPL2)
depends=(glib2)
options=(!libtool)
source=(http://downloads.sourceforge.net/project/tilp/tilp2-linux/tilp2-1.18/$pkgname-$pkgver.tar.bz2)
sha256sums=('316da6a73bf26b266dd23443882abc4c9fe7013edc3a53e5e301d525c2060878')
sha512sums=('ea589344a656c5c7d28ed45e8da36bf7b746b7a82d77a257ddd305e2ebdc34f0ae14a6090e991f47ef7ad37cdc8d7182181c705fb0814e671ef764ca2a6dc2bf')

build() {
    cd $pkgname-$pkgver/
    autoreconf -fi
    ./configure --prefix=/usr --enable-iconv
    make
}

package() {
    make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
}
