# maintainer: luka null <lukadevnull@vivaldi.net>
# old maintainer: Alexey Kh <aur@devass.club>
pkgname=pg_rum
pkgver=1.3.8
pkgrel=1
pkgdesc='RUM access method for PostgreSQL - inverted index with additional information in posting lists'
arch=('x86_64')
url='https://github.com/postgrespro/rum'
license=('custom:PostgreSQL')
depends=('postgresql')
makedepends=("make" "gcc" "llvm" "clang")
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('dda1f4446d6796b7b9b363403393d2ea5eb14606d21b06ae610d4b01b07e9115')

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
