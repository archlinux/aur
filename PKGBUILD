# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=effitask
pkgver=1.3.0
pkgrel=1
pkgdesc='Graphical task manager, based on the todo.txt format'
url="https://github.com/sanpii/$pkgname"
arch=('x86_64')
license=('MIT')
depends=('gtk3')
makedepends=('cargo' 'rust-nightly')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('e88bdac2ab676b5e548b73e8185bf7c955fda58ae4a507b01e27c2fbb447d9b0')

build()
{
    cd "$pkgname-$pkgver"

    cargo build --release
}

package()
{
    cd "$pkgname-$pkgver"

    make install PREFIX="$pkgdir"
}
