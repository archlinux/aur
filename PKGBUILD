# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=effitask
pkgver=1.0.1
pkgrel=1
pkgdesc='Graphical task manager, based on the todo.txt format'
url="https://github.com/sanpii/$pkgname"
arch=('x86_64')
license=('MIT')
depends=('gtk3')
makedepends=('cargo')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('37199050cf90bead04b11c63c3a34dcc6479d81ba12cda3b1a711068532ab6f7')

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
