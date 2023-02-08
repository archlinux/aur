# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=effitask
pkgver=1.4.2
pkgrel=1
pkgdesc='Graphical task manager, based on the todo.txt format'
url="https://github.com/sanpii/$pkgname"
arch=('x86_64')
license=('MIT')
depends=('gtk3')
makedepends=('cargo' 'rust')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('1bbc5d0151e9b2a7b2da60d3125146091f03e31c3685ce9664cd0ff7eb38f7fc')

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
