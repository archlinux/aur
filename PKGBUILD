# Maintainer: Pierre-Yves Ritschard <pyr@spootnik.org>
# Maintainer: László Várady <laszlo.varady93@gmail.com>

pkgname=riemann-c-client
pkgver=2.2.2
pkgrel=1
pkgdesc='Riemann C driver library and CLI client'
url="https://git.madhouse-project.org/algernon/riemann-c-client"
license=('LGPL3')
arch=(i686 x86_64 armv7h)
depends=(zlib protobuf-c gnutls json-c)
makedepends=(git autoconf automake)
source=("https://git.madhouse-project.org/algernon/riemann-c-client/archive/riemann-c-client-${pkgver}.tar.gz")
sha256sums=('468c2d6cb4095e581927005a1dab13656f5a9355e4c68a3a25fceb5c6798a72f')

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
