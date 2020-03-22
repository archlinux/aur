# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=explain
pkgver=1.1.0
pkgrel=1
pkgdesc='Transform postgresql explain to a graph'
url="https://github.com/sanpii/$pkgname"
arch=('x86_64')
license=('MIT')
depends=()
optdepends=('graphviz' 'postgresql')
makedepends=('cargo')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('6f9cb15d816b2421f2eaf2d0c27f55a9d741f79d58056ce2aed6ada9ad5c5934')

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
