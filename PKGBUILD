# Maintainer: Pierre-Yves Ritschard <pyr@spootnik.org>
# Maintainer: László Várady <laszlo.varady93@gmail.com>

pkgname=riemann-c-client
pkgver=2.1.0
pkgrel=1
pkgdesc='Riemann C driver library and CLI client'
url="https://git.madhouse-project.org/algernon/riemann-c-client"
license=('LGPL3')
arch=(i686 x86_64 armv7h)
depends=(zlib protobuf-c gnutls json-c)
makedepends=(git autoconf automake)
source=("https://git.madhouse-project.org/algernon/riemann-c-client/archive/riemann-c-client-${pkgver}.tar.gz")
sha256sums=('e1a4439ee23f4557d7563a88c67044d50c384641cf160d95114480404c547085')

build() {
  cd "$pkgname"
  autoreconf -i
  ./configure --prefix=/usr --with-tls=gnutls
  make
}

package() {
  cd "$pkgname"
  make install DESTDIR="$pkgdir"
}
