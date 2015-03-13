# Maintainer: Vianney le Clément <vleclement AT gmail·com>
pkgname=imx-usb-loader-git
pkgver=r81.f96aee2
pkgrel=1
pkgdesc="USB loader for Freescale i.MX 51/53/6x"
arch=('i686' 'x86_64')
url="https://github.com/boundarydevices/imx_usb_loader"
license=('LGPL2.1')
depends=('libusb')
makedepends=('git')
source=("git://github.com/boundarydevices/imx_usb_loader.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/imx_usb_loader"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/imx_usb_loader"
  make
}

package() {
  cd "$srcdir/imx_usb_loader"
  make install DESTDIR="$pkgdir" sysconfdir=/etc
}
