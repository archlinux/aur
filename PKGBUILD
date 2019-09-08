# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=libnbd
pkgver=1.0.1
pkgrel=1
pkgdesc="NBD client library in userspace"
arch=('i686' 'x86_64')
url="https://github.com/libguestfs/libnbd"
license=('LGPL2.1')
depends=()
makedepends=('perl')
validpgpkeys=('F7774FB1AD074A7E8C8767EA91738F73E1B768A0')
source=(
		"http://download.libguestfs.org/libnbd/1.0-stable/libnbd-${pkgver}.tar.gz"
		"http://download.libguestfs.org/libnbd/1.0-stable/libnbd-${pkgver}.tar.gz.sig"
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

sha256sums=('e0a6f6ed12a00a4e48c30f29b86290625220d99dd0e49ba3d6b2f51158ad68da'
            'SKIP')
