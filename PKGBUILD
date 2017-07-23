# Maintainer: Mauro Santos <registo.mailling@gmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Jason Chu <jason@archlinux.org>

pkgname=usbview2
pkgver=0.4a
pkgrel=2
_pkgver=${pkgver/./_}
pkgdesc="USB Viewer"
arch=('i686' 'x86_64')
url="http://usbview2.sourceforge.net"
license=('GPL')
depends=('gtk2' 'libusb-compat')
makedepends=('pkg-config')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/v${_pkgver}/${pkgname}-v${_pkgver}.tar.gz")
sha256sums=('b46ead529929b2f6ac844d463e4992a8e9ba15a2bf428f23b393b74a41212006')

build() {
  cd "${srcdir}/${pkgname}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}
