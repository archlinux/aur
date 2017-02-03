# Maintainer: Javier Torres <jtorres@carto.com>
pkgname=carto-postgresql
pkgver=0.18.5.r1.795d92d
pkgrel=1
pkgdesc="PostgreSQL extension for CARTO"
arch=('x86_64')
url="https://github.com/CartoDB/cartodb-postgresql"
license=('BSD')
groups=()
depends=('postgresql')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/CartoDB/cartodb-postgresql.git')
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/cartodb-postgresql"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/cartodb-postgresql"
}

build() {
	cd "$srcdir/cartodb-postgresql"
  make all
}

package() {
	cd "$srcdir/cartodb-postgresql"
  DESTDIR=$pkgdir make install

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
