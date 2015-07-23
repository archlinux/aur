# Maintainer:  Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Stefano Bergamini <bergs at live dot it>
# Contributor: Heiko Baums <heiko@baums-on-web.de>
# Contributor: Quentin Foussette <quentinf7@gmail.com>

pkgname=epson-inkjet-printer-escpr
pkgver=1.5.0
pkgrel=1
pkgdesc="Epson Inkjet Printer Driver (ESC/P-R) for Linux"
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('GPL2')
depends=('cups' 'ghostscript')
options=('!libtool')
source=('https://download3.ebz.epson.net/dsc/f/03/00/03/89/04/31da65675eb5966b63b2399ab00d9f60f064530d/epson-inkjet-printer-escpr-1.5.0-1lsb3.2.src.rpm')
sha256sums=('2588fe5de814e76d02bf27480855eed4d827b7718bf7bb87b84c6a95694c02e2')

prepare() {
  tar zxf "$pkgname-$pkgver-1lsb3.2.tar.gz"
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr \
              --with-cupsfilterdir=/usr/lib/cups/filter \
              --with-cupsppddir=/usr/share/ppd
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}




