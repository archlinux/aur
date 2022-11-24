# maintainer: luka null <lukadevnull@vivaldi.net>
# old maintainer: Alexey Kh <aur@devass.club>
pkgname=pg_rum
pkgver=1.3.13
pkgrel=1
pkgdesc='RUM access method for PostgreSQL - inverted index with additional information in posting lists'
arch=('x86_64')
url='https://github.com/postgrespro/rum'
license=('custom:PostgreSQL')
depends=('postgresql')
makedepends=("make" "gcc" "llvm" "clang")
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('6ab370532c965568df6210bd844ac6ba649f53055e48243525b0b7e5c4d69a7d')

build()
{
    cd "rum-$pkgver"

    make USE_PGXS=1
}

package()
{
    cd "rum-$pkgver"

    make USE_PGXS=1 DESTDIR="$pkgdir" install
}
