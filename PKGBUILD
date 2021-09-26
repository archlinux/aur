# Maintainer: Pierre-Yves Ritschard <pyr@spootnik.org>
# Maintainer: László Várady <laszlo.varady93@gmail.com>

pkgname=riemann-c-client
pkgver=1.10.5
pkgrel=1
pkgdesc='Riemann C driver library and CLI client'
url="https://github.com/algernon/riemann-c-client"
license=('LGPL3')
source=(git+https://github.com/algernon/riemann-c-client#tag=riemann-c-client-$pkgver)
arch=(i686 x86_64 armv7h)
depends=(zlib protobuf-c gnutls)
makedepends=(git autoconf automake)
sha256sums=('SKIP')

build() {
  cd riemann-c-client
  autoreconf -i
  ./configure --prefix=/usr --enable-tls
  make
}

package() {
  cd riemann-c-client
  make install DESTDIR="$pkgdir"
}
