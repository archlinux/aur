# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=sqlite_fdw
pkgver=2.5.0
pkgrel=1
pkgdesc='SQLite Foreign Data Wrapper for PostgreSQL'
arch=('x86_64')
url="https://github.com/pgspider/$pkgname"
license=('postgresql')
depends=('sqlite')
makedepends=('llvm15')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('4130ed670cc2b61372e81344b824e51d1530859970a4286f6a2c627421912527')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    make USE_PGXS=1
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    make install USE_PGXS=1 DESTDIR=$pkgdir
}
