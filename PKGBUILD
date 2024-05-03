pkgname=libelectron
pkgver=1.0.22
pkgrel=1
arch=("x86_64" "aarch64")
url="https://gitlab.com/linuxbombay/libelectron/libelectron"
license=('GPL')
depends=('npm' 'git' 'icu')
pkgdesc="A collection of npm dependencies for electron packages."
makedepends=('unzip')
source=("$url/-/archive/$pkgver-$pkgrel/libelectron-$pkgver-$pkgrel.tar.bz2")
sha256sums=('a01953052b63a97155999fbfa05fc50a038d49150b1c5ec8e73625e0c64f2d9f')

package() {
    for dir in $pkgname-$pkgver-$pkgrel ; do mv "${dir}" "$pkgname" ;done
    cd "$srcdir/$pkgname"
    ./setup 
    install -dm755 "$pkgdir/opt/libelectron"
    cp -r "$srcdir/libelectron/node_modules" "$pkgdir/opt/libelectron"
}
