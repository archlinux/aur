pkgname=libelectron
pkgver=1.0.21
pkgrel=1
arch=("x86_64" "aarch64")
url="https://gitlab.com/libelectron/libelectron"
license=('GPL')
depends=('npm' 'git' 'icu')
pkgdesc="A collection of npm dependencies for electron packages."
makedepends=('unzip')
#source=("https://gitlab.com/libelectron/libelectron/-/archive/$pkgver-$pkgrel/libelectron-$pkgver-1.tar.bz2")
#Backup temp repo
source=("https://github.com/libelectron/libelectron/archive/refs/tags/$pkgver-$pkgrel.tar.gz")
sha256sums=('SKIP')

package() {
    for dir in $pkgname-$pkgver-$pkgrel ; do mv "${dir}" "$pkgname" ;done
    cd "$srcdir/$pkgname"
    ./setup 
    install -dm755 "$pkgdir/opt/libelectron"
    cp -r "$srcdir/libelectron/node_modules" "$pkgdir/opt/libelectron"
}
