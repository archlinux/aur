# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=effitask
pkgver=1.4.1
pkgrel=1
pkgdesc='Graphical task manager, based on the todo.txt format'
url="https://github.com/sanpii/$pkgname"
arch=('x86_64')
license=('MIT')
depends=('gtk3')
makedepends=('cargo' 'rust')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('3546c75c4192a128c141a804eb2e972cceccf70aa841d91a33bfa5d968a0dd5a')

build()
{
    cd "$pkgname-$pkgver"

    cargo build --release
}

package()
{
    cd "$pkgname-$pkgver"

    make install PREFIX="$pkgdir/usr"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
