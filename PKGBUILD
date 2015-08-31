# Contributer  : Philipp Geyer <nistur@gmail.com>
# Modified     : Gustavo Alvarez <sl1pkn07 [at] gmail [dot] com>
# moved to AUR4: GI Jack <iamjacksemail@hackermail.com>

pkgname=crark
pkgver=5.0
download="crark50.rar"
pkgrel=1
pkgdesc="A command-line utility for RAR 2.x-3.x password cracking, uses Password Cracking Library 2.0 that supports special password recovery language. Highly optimized for all modern processors."
arch=('i686' 'x86_64')
url="http://www.crark.net/"
license="unknown"
depends=('unrar')
makedepends=('unrar')
provides=('crark')
source=("http://www.crark.net/download/${download}")
sha256sums=('db208e290a1f1992d5c4fd77b2317cfd974034daf354d3009ce0b17993bdf633')
install=install
build() {
  mkdir -p ${pkgname}-${pkgver}
  unrar x -xcrackme ${download} ${pkgname}-${pkgver}
  cd ${srcdir}/${pkgname}-${pkgver}
}
package() {
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -R ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/opt/${pkgname}
  chmod +r ${pkgdir}/opt/${pkgname}/{spanish,english,russian}.def
}

