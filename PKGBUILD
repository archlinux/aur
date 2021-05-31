# Maintainer: Javier Torres <jtorres@carto.com>
pkgname=odbc_fdw
pkgver=0.5.1
pkgrel=1
pkgdesc="PostgreSQL extension that implements a Foreign Data Wrapper (FDW) for remote databases using ODBC"
arch=('x86_64')
url="https://github.com/CartoDB/odbc_fdw"
license=('BSD')
groups=()
depends=('postgresql' 'unixodbc')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("https://github.com/CartoDB/odbc_fdw/archive/$pkgver.tar.gz")
noextract=()
sha256sums=('e34d55d85cd5af17b915be3e47a8506908bd5ee8cb691db71efa0fd891780357')

build() {
  cd "$srcdir/odbc_fdw-$pkgver"
  make
}

package() {
  cd "$srcdir/odbc_fdw-$pkgver"

  make install DESTDIR="$pkgdir"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
