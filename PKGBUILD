# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=effitask
pkgver=1.1.0
pkgrel=2
pkgdesc='Graphical task manager, based on the todo.txt format'
url="https://github.com/sanpii/$pkgname"
arch=('x86_64')
license=('MIT')
depends=('gtk3')
makedepends=('cargo' 'rust-nightly')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('06de8f3c23bea7495ef5dfa077fdc245efccca6431504f6c2e3e91bd12f3225b')

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
