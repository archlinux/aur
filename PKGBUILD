# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=explain
pkgver=1.0.0
pkgrel=1
pkgdesc='Transform postgresql explain to a graph'
url="https://github.com/sanpii/$pkgname"
arch=('x86_64')
license=('MIT')
depends=()
optdepends=('graphviz' 'postgresql')
makedepends=('cargo' 'rust')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('e8d820120e39e657f811827b17a3a52e910faa57371406e0f496e287ee3d90ac')

build()
{
    cd "$pkgname-$pkgver"

    cargo build --release
}

package()
{
    cd "$pkgname-$pkgver"

    make install PREFIX="$pkgdir/usr"
}
