# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=libusbgx
pkgver=0.3.0
pkgrel=1
pkgdesc='Library encapsulating the kernel USB gadget-configfs userspace API functionality'
arch=('x86_64')
url='https://github.com/linux-usb-gadgets/libusbgx/'
depends=('libconfig')
makedepends=('automake')
license=('GPL2')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/linux-usb-gadgets/libusbgx/archive/libusbgx-v${pkgver}.tar.gz"
)

build() {
  cd "${srcdir}/libusbgx-libusbgx-v${pkgver}"

  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/libusbgx-libusbgx-v${pkgver}"

  make install DESTDIR="$pkgdir"
}

sha256sums=('23d72c415ffd80d752efccc9bb5a6afdece6a83a31975344ef31a4967d189e3c')
