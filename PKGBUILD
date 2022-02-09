# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=explain
pkgver=1.4.0
pkgrel=1
pkgdesc='Transform postgresql explain to a graph'
url="https://github.com/sanpii/$pkgname"
arch=('x86_64')
license=('MIT')
depends=()
optdepends=('graphviz' 'postgresql')
makedepends=('cargo')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('577896926b420c302ac860a98b4f4b9358929c738fa90ada2cc5bddb0cf6d7ed')

build()
{
    cd "$pkgname-$pkgver"

    make
}

package()
{
    cd "$pkgname-$pkgver"

    make install PREFIX="$pkgdir/usr"
    install -Dm 644 docs/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
