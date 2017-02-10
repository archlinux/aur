# Maintainer: Javier Torres <jtorres@carto.com>
pkgname=odbc_fdw
pkgver=0.2.0.r11.9a49548
pkgrel=1
pkgdesc="PostgreSQL extension that implements a Foreign Data Wrapper (FDW) for remote databases using ODBC"
arch=('x86_64')
url="https://github.com/CartoDB/odbc_fdw"
license=('BSD')
groups=()
depends=('postgresql')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/CartoDB/odbc_fdw.git#branch=postgresql_9.6')
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/odbc_fdw"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/odbc_fdw"
}

build() {
	cd "$srcdir/odbc_fdw"

	make
}

package() {
	cd "$srcdir/odbc_fdw"

  make install DESTDIR="$pkgdir"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
