# Maintainer: LS-Shandong <ls-shandong@outlook.com>

pkgbase=guile-dbd-sqlite3
pkgname=guile-dbd-sqlite3
pkgver=3.3.0
pkgrel=1
pkgdesc='The dbd plugin connects to an actual SQLite3 database server'
arch=('x86_64' 'aarch64')
url='https://github.com/opencog/guile-dbi'
license=('GPL-2.0-only')
pkgdepend=guile-dbi
depends=('guile' 'guile-dbi' 'sqlite')
makedepends=('libtool')
source=("${url}/archive/${pkgdepend}-${pkgver}.tar.gz")
sha256sums=('af92ca21240eda178da8528ba8b77dd2245813d1bef524d6015b5f6519df800b')
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
