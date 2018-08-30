# Maintainer: Alexey Kh <aur@devass.club>
pkgname=pg_rum
pkgver=1.2.1
pkgrel=1
pkgdesc='RUM access method - inverted index with additional information in posting lists'
arch=('x86_64')
url='https://github.com/postgrespro/rum'
license=('custom:PostgreSQL')
depends=('postgresql')
source=("$url/archive/$pkgver.tar.gz")

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

md5sums=('0190b2184659d171383db2cbcfb54d8b')

