# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=explain
pkgver=1.5.0
pkgrel=1
pkgdesc='Transform postgresql explain to a graph'
url="https://github.com/sanpii/$pkgname"
arch=('x86_64')
license=('MIT')
depends=()
optdepends=('graphviz' 'postgresql')
makedepends=('cargo')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('1a8807aa8096a3396b130ec99dff777df2ca3f013c72ab7901c850cd82559ecf')

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
