# maintainer: luka null <lukadevnull@vivaldi.net>
# old maintainer: Alexey Kh <aur@devass.club>
pkgname=pg_rum
pkgver=1.3.6
pkgrel=1
pkgdesc='RUM access method for PostgreSQL - inverted index with additional information in posting lists'
arch=('x86_64')
url='https://github.com/postgrespro/rum'
license=('custom:PostgreSQL')
depends=('postgresql')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('75beb61b0ad1c253d1afb1c8f7a80e0f3996d3356b93a55faf9aad6fc5c8c0d9')

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
