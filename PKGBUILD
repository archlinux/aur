# Maintainer: LS-Shandong <ls-shandong@outlook.com>

pkgbase=guile-dbd-sqlite3
pkgname=guile-dbd-sqlite3
pkgver=2.1.9
pkgrel=2
pkgdesc='The dbd plugin connects to an actual SQLite3 database server'
arch=('x86_64' 'aarch64')
url='https://github.com/opencog/guile-dbi'
license=('GPL2')
pkgdepend=guile-dbi
depends=('guile' 'guile-dbi' 'sqlite')
source=("${url}/archive/${pkgdepend}-${pkgver}.tar.gz")
sha256sums=('25C38FE7E7176B4340951093FCBD13A9E6532D76399310CB6DF19E169EC19347')
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
