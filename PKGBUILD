# Maintainer: Deon Spengler <deon@spengler.co.za>

pkgname=ocesql
pkgver=1.4
pkgrel=1
pkgdesc="SQL pre-compiler for cobol"
arch=(x86_64 aarch64)
url="https://github.com/opensourcecobol/Open-COBOL-ESQL"
license=(GPL-3.0-only)
depends=('postgresql-libs')
makedepends=('autoconf')
source=("https://github.com/opensourcecobol/Open-COBOL-ESQL/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c0310473aa38ea2921ae4c45ff2463be9cd874efd488d23cd8b0f687644060fd')

build() {
  cd "Open-COBOL-ESQL-${pkgver}"

  ./autogen.sh
  mkdir build
  cd build
  ../configure --prefix=/usr
  make
}

package() {
  cd "Open-COBOL-ESQL-${pkgver}/build"

  make DESTDIR="${pkgdir}" install
}
