# Maintainer: Deon Spengler <deon@spengler.co.za>

pkgname=ddcutil
pkgver=0.9.8
pkgrel=1
pkgdesc='Query and change Linux monitor settings using DDC/CI and USB.'
url='http://ddcutil.com/'
license=('GPL2')
depends=(glib2 libusb udev libdrm libxrandr)
source=(https://github.com/rockowitz/ddcutil/archive/v${pkgver}.tar.gz)
sha256sums=('445478a226d3fc46c6c058e503bba416948dad1152736b3c91326e60bbfc9025')
arch=('x86_64')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim: ft=sh ts=2 sw=2 et
