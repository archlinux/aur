# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=explain
pkgver=1.3.0
pkgrel=1
pkgdesc='Transform postgresql explain to a graph'
url="https://github.com/sanpii/$pkgname"
arch=('x86_64')
license=('MIT')
depends=()
optdepends=('graphviz' 'postgresql')
makedepends=('cargo')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('447aa762f29b6b992166c4bd256c3e329ceee86e44d78ff74a4b29f964693820')

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
