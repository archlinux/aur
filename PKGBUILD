# Maintainer: Deon Spengler <deon[at]spengler[dot]co[dot]za>

pkgname=ddcutil
pkgver=0.9.1
pkgrel=1
pkgdesc='Query and change Linux monitor settings using DDC/CI and USB.'
url='http://ddcutil.com/'
license=('GPL')
conflicts=('ddcutil-git')
depends=(glib2 libusb udev libdrm libxrandr)
source=(https://github.com/rockowitz/ddcutil/archive/v${pkgver}.tar.gz)
sha256sums=('bc7055604f2767b903845ccbdbe9fbd5fc79962d45eee817f164cfb472de777b')
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
