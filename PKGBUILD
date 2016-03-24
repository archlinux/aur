# Maintainer: Pierre-Yves Ritschard <pyr@spootnik.org>

pkgname=riemann-c-client
pkgver=1.8.1
pkgrel=1
pkgdesc='Riemann C driver library and CLI client'
url="https://github.com/algernon/riemann-c-client"
license=('BSD')
source=(git+https://github.com/algernon/riemann-c-client#tag=riemann-c-client-1.8.1)
arch=(i686 x86_64 armv7h)
depends=(glibc zlib protobuf-c)
makedepends=(git autoconf automake)
sha256sums=('SKIP')

build() {
  cd riemann-c-client
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd riemann-c-client
  make install DESTDIR="$pkgdir"
  install -D -m644 LGPL "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
