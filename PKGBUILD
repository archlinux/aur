# Contributor: Erik Johnson <palehose at gmail dot com>

pkgname=libucl
pkgver=0.7.3
pkgrel=1
pkgdesc='Universal Config Language'
arch=('i686' 'x86_64')
url='https://github.com/vstakhov/libucl'
depends=()
makedepends=()
license=('BSD')
source=("https://github.com/vstakhov/libucl/archive/${pkgver}.tar.gz")
sha256sums=('2f69995c7f8320350f56c1183c395cc4a2a958331f22d60b7839a117c9c601e1')

build() {
  cd "${pkgname}-${pkgver}"
  ./autogen.sh && ./configure --prefix=/usr --sysconfdir=/etc && make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
