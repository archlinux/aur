# Maintainer: 1ridic <i@iridium.cyou>
_pkgname=pg_cjk_parser
pkgname=${_pkgname}-git
pkgver=r22.bd70b93
provides=('pg_cjk_parser')
conflicts=('pg_cjk_parser')
license=('custom')
pkgrel=1
pkgdesc="fts (full text search) parser derived from the default parser in PostgreSQL"
arch=(x86_64)
url="https://github.com/yukha-dw/pg_cjk_parser"
depends=(postgresql icu)
makedepends=(llvm clang git)
source=("git+https://github.com/yukha-dw/pg_cjk_parser.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  make clean
}

package() {
  cd "${_pkgname}"
  make DESTDIR="$pkgdir/" install
}


