# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=sqlite_fdw
pkgver=1.3.1
pkgrel=1
pkgdesc='SQLite Foreign Data Wrapper for PostgreSQL'
arch=('x86_64')
url="https://github.com/pgspider/$pkgname"
license=('postgresql')
depends=('sqlite')
makedepends=()
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('824b4ee67bd43b0a66541fc00159f9dfdf6e4bd644b9e8c1b26315ce6c0842fa')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    make USE_PGXS=1
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    make install USE_PGXS=1 DESTDIR=$pkgdir
}
