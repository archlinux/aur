pkgname=libelectron
pkgver=1.0.17
pkgrel=1
arch=("x86_64" "aarch64")
url="https://gitlab.com/libelectron/libelectron"
license=('GPL')
depends=('npm' 'git' 'icu')
pkgdesc="A collection of npm dependencies for electron packages."
makedepends=('unzip')
source=("https://gitlab.com/libelectron/libelectron/-/archive/$pkgver-$pkgrel/libelectron-$pkgver-1.tar.bz2")
sha256sums=('SKIP')

package() {
    for dir in $pkgname-$pkgver-$pkgrel ; do mv "${dir}" "$pkgname" ;done
    cd "$srcdir/$pkgname"
    #chmod +x install
    ./setup 
    install -dm755 "$pkgdir/opt/libelectron"
    cp -r $srcdir/libelectron/node_modules "$pkgdir/opt/libelectron"
}
