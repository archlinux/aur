# Maintainer: Andrea Girotto <andrea (dot) girotto (at) gmail (dot) com>

pkgname=guile-dbd-postgresql
pkgver=3.1.1
pkgrel=1
pkgdesc='The dbd plugin connects to an actual PostgreSQL database server'
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/opencog/guile-dbi'
license=('GPL-2.0-only')
pkgdepend=guile-dbi
depends=('guile' 'guile-dbi' 'postgresql-libs')
makedepends=('libtool')
source=("${url}/archive/${pkgdepend}-${pkgver}.tar.gz")
sha256sums=('66bcb1544a8757d02b2b856694bc864646b99a52a4b65102b1d259ba47135ff5')
options=(!strip)

build () {
  cd "${srcdir}/${pkgdepend}-${pkgdepend}-$pkgver/${pkgbase}"
  ./autogen.sh --no-configure
  mkdir build
  cd build
  ../configure --prefix=/usr
  make
}

package () {
  cd "${srcdir}/${pkgdepend}-${pkgdepend}-$pkgver/${pkgname}/build"
  make DESTDIR="$pkgdir" install
}
