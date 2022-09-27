# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=sqlite_fdw
pkgver=2.2.0
pkgrel=1
pkgdesc='SQLite Foreign Data Wrapper for PostgreSQL'
arch=('x86_64')
url="https://github.com/pgspider/$pkgname"
license=('postgresql')
depends=('sqlite')
makedepends=()
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('1fdc322affa5f9616bdb054cdf05618097085e616b122c6a70b5210f6093b33c')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    make USE_PGXS=1
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    make install USE_PGXS=1 DESTDIR=$pkgdir
}
