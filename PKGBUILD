# Maintainer: LS-Shandong <ls-shandong@outlook.com>

pkgbase=guile-dbd-sqlite3
pkgname=guile-dbd-sqlite3
pkgver=3.1.1
pkgrel=1
pkgdesc='The dbd plugin connects to an actual SQLite3 database server'
arch=('x86_64' 'aarch64')
url='https://github.com/opencog/guile-dbi'
license=('GPL-2.0-only')
pkgdepend=guile-dbi
depends=('guile' 'guile-dbi' 'sqlite')
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
  cd "${srcdir}/${pkgdepend}-${pkgdepend}-$pkgver/${pkgbase}/build"
  make DESTDIR="$pkgdir" install
}
