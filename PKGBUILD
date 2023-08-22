# Maintainer: Pierre-Yves Ritschard <pyr@spootnik.org>
# Maintainer: László Várady <laszlo.varady93@gmail.com>

pkgname=riemann-c-client
pkgver=2.1.1
pkgrel=1
pkgdesc='Riemann C driver library and CLI client'
url="https://git.madhouse-project.org/algernon/riemann-c-client"
license=('LGPL3')
arch=(i686 x86_64 armv7h)
depends=(zlib protobuf-c gnutls json-c)
makedepends=(git autoconf automake)
source=("https://git.madhouse-project.org/algernon/riemann-c-client/archive/riemann-c-client-${pkgver}.tar.gz")
sha256sums=('097e710096dc2e901ae95108277eff1acb6d0383f04137cdea4ce55257c08e10')

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
