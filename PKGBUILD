# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=sqlite_fdw
pkgver=2.0.0
pkgrel=1
pkgdesc='SQLite Foreign Data Wrapper for PostgreSQL'
arch=('x86_64')
url="https://github.com/pgspider/$pkgname"
license=('postgresql')
depends=('sqlite')
makedepends=()
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('8bcec6d3f38c5c2983fb0855d3b983e10b0c5390b5263e1654a21f209ba2bc4d')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    make USE_PGXS=1
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    make install USE_PGXS=1 DESTDIR=$pkgdir
}
