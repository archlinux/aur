# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=libusbgx
pkgver=0.2.0
pkgrel=1
pkgdesc='Library encapsulating the kernel USB gadget-configfs userspace API functionality'
arch=('i686' 'x86_64')
url='https://github.com/libusbgx/libusbgx/'
depends=('libconfig')
makedepends=('automake')
license=('GPL2')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/libusbgx/libusbgx/archive/libusbgx-v${pkgver}.tar.gz")

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

sha256sums=('b15abc89a0ef82c6a650cc1d58b5ba50f7ce076db392add84caabcd86c608ee2')
