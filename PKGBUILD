pkgname=libelectron
pkgver=1.0.23
pkgrel=2
arch=("x86_64" "aarch64")
url="https://gitlab.com/linuxbombay/libelectron/libelectron"
license=('GPL')
depends=('npm' 'git' 'icu')
pkgdesc="A collection of npm dependencies for electron packages."
makedepends=('unzip')
source=("$url/-/archive/$pkgver-$pkgrel/libelectron-$pkgver-$pkgrel.tar.bz2")
sha256sums=('f7a0bae6e6f1d91627ec8f49edb05c953de9029db51ac6815456abf4b31394ed')

package() {
    for dir in $pkgname-$pkgver-$pkgrel ; do mv "${dir}" "$pkgname" ;done
    cd "$srcdir/$pkgname"
    ./setup 
    install -dm755 "$pkgdir/opt/libelectron"
    cp -r "$srcdir/libelectron/node_modules" "$pkgdir/opt/libelectron"
}
