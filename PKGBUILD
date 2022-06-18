# Maintainer: Pierre-Yves Ritschard <pyr@spootnik.org>
# Maintainer: László Várady <laszlo.varady93@gmail.com>

pkgname=riemann-c-client
pkgver=2.0.1
pkgrel=1
pkgdesc='Riemann C driver library and CLI client'
url="https://github.com/algernon/riemann-c-client"
license=('LGPL3')
arch=(i686 x86_64 armv7h)
depends=(zlib protobuf-c gnutls json-c)
makedepends=(git autoconf automake)
source=("https://github.com/algernon/riemann-c-client/archive/refs/tags/riemann-c-client-${pkgver}.tar.gz")
sha256sums=('2ed963eeef5517f7be921790ef0cde13c7bcac172ac14ce5818d84a261cc3b31')

build() {
  cd "$pkgname-$pkgname-$pkgver"
  autoreconf -i
  ./configure --prefix=/usr --with-tls=gnutls
  make
}

package() {
  cd "$pkgname-$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
}
