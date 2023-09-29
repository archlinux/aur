# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=pg_partman
pkgver=5.0.0
pkgrel=1
pkgdesc='Partition management extention for PostgreSQL'
arch=('x86_64')
url="https://github.com/pgpartman/$pkgname"
license=('custom:PostgreSQL')
depends=('python' 'postgresql')
makedepends=('llvm15')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('222e7175c9afc417aa6e03e826de4a5eb2a88fd8d1e3d06321aa8dac2471c005')

build()
{
    cd "$pkgname-$pkgver"

    make
}

package()
{
    cd "$pkgname-$pkgver"

    make DESTDIR="$pkgdir" install
}
