# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=sqlite_fdw
pkgver=1.3.2
pkgrel=1
pkgdesc='SQLite Foreign Data Wrapper for PostgreSQL'
arch=('x86_64')
url="https://github.com/pgspider/$pkgname"
license=('postgresql')
depends=('sqlite')
makedepends=()
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('da75f3908dbd41437f15185bb9a508c4f2487a66c7e78b0aef28c3b4a0213db2')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    make USE_PGXS=1
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    make install USE_PGXS=1 DESTDIR=$pkgdir
}
