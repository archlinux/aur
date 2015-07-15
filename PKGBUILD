# Maintainer: Mauro Santos <registo.mailling@gmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Jason Chu <jason@archlinux.org>

pkgname=usbview2
pkgver=0.4a
pkgrel=1
_pkgver=${pkgver/./_}
pkgdesc="USB Viewer"
arch=('i686' 'x86_64')
url="http://usbview2.sourceforge.net"
license=('GPL')
depends=('gtk2' 'libusb-compat')
makedepends=('pkg-config')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/v${_pkgver}/${pkgname}-v${_pkgver}.tar.gz")
md5sums=('42f4e7ee90088e433050b7738a3df145')
PKGEXT='.pkg.tar'

build() {
  cd "${srcdir}/${pkgname}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}
