# Maintainer: ianux <ianux@free.fr>

pkgname=asdcplib
pkgver=1.12.60
pkgrel=1
pkgdesc="open source implementation of SMPTE and the MXF Interop “Sound & Picture Track File” format"
arch=('i686' 'x86_64')
url="http://www.cinecert.com/asdcplib/"
license=('GPL3')
depends=('expat' 'openssl')
source=(http://download.cinecert.com/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha1sums=('427268c3070827af63e067ff4d87aa32fe26ac1d')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}

