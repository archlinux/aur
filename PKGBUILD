# Maintainer:  Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Stefano Bergamini <bergs at live dot it>
# Contributor: Heiko Baums <heiko@baums-on-web.de>
# Contributor: Quentin Foussette <quentinf7@gmail.com>

pkgname=epson-inkjet-printer-escpr
pkgver=1.4.3
pkgrel=1
pkgdesc="Epson Inkjet Printer Driver (ESC/P-R) for Linux"
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('GPL2')
depends=('cups' 'ghostscript')
options=('!libtool')
source=('https://download2.ebz.epson.net/dsc/f/03/00/03/22/35/2f05752c0fdad7417b2835b2e1604c64845ba2de/epson-inkjet-printer-escpr-1.4.3-1lsb3.2.src.rpm')
md5sums=('22f5218d03350ce0e7a1afa2656287fa')

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




