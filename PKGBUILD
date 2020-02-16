# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=libnbd
pkgver=1.2.2
pkgrel=2
pkgdesc="NBD client library in userspace"
arch=('i686' 'x86_64')
url="https://github.com/libguestfs/libnbd"
license=('LGPL2.1')
depends=()
makedepends=('perl')
validpgpkeys=('F7774FB1AD074A7E8C8767EA91738F73E1B768A0')
source=(
		"http://download.libguestfs.org/libnbd/1.2-stable/libnbd-${pkgver}.tar.gz"
		"http://download.libguestfs.org/libnbd/1.2-stable/libnbd-${pkgver}.tar.gz.sig"
)


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -i
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

sha256sums=('075c26b39580c96df01818447c8c5b1779a79265cfb6b83ddcee37a3a2c6a905'
            'SKIP')
