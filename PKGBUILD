pkgname=libelectron
pkgver=1.0.23
pkgrel=1
arch=("x86_64" "aarch64")
url="https://gitlab.com/linuxbombay/libelectron/libelectron"
license=('GPL')
depends=('npm' 'git' 'icu')
pkgdesc="A collection of npm dependencies for electron packages."
makedepends=('unzip')
source=("$url/-/archive/$pkgver/libelectron-$pkgver.tar.bz2")
sha256sums=('63b9c2a610ff76014cf7ededc38fa3c744fb4fd582d3a9ac68d8a07d121d1c10')

package() {
    for dir in $pkgname-$pkgver ; do mv "${dir}" "$pkgname" ;done
    cd "$srcdir/$pkgname"
    ./setup 
    install -dm755 "$pkgdir/opt/libelectron"
    cp -r "$srcdir/libelectron/node_modules" "$pkgdir/opt/libelectron"
}
