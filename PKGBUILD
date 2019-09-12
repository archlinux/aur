# Maintainer: Deon Spengler <deon[at]spengler[dot]co[dot]za>

pkgname=ddcutil
pkgver=0.9.7
pkgrel=1
pkgdesc='Query and change Linux monitor settings using DDC/CI and USB.'
url='http://ddcutil.com/'
license=('GPL2')
depends=(glib2 libusb udev libdrm libxrandr)
source=(https://github.com/rockowitz/ddcutil/archive/v${pkgver}.tar.gz)
sha256sums=('56a520a68e00e519a3ea5562238b2a67c0b9c4133a9b61983fe82b24e7066222')
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
