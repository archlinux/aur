pkgname=libelectron
pkgver=1.0.23
pkgrel=1
arch=("x86_64" "aarch64")
url="https://gitlab.com/linuxbombay/libelectron/libelectron"
license=('GPL')
depends=('npm' 'git' 'icu')
pkgdesc="A collection of npm dependencies for electron packages."
makedepends=('unzip')
source=("$url/-/archive/$pkgver-$pkgrel/libelectron-$pkgver-$pkgrel.tar.bz2")
sha256sums=('a78b041b355c65c1e7a1713d91a74ba25ad601e3620fff6193b716e4651919e9')

package() {
    for dir in $pkgname-$pkgver-$pkgrel ; do mv "${dir}" "$pkgname" ;done
    cd "$srcdir/$pkgname"
    ./setup 
    install -dm755 "$pkgdir/opt/libelectron"
    cp -r "$srcdir/libelectron/node_modules" "$pkgdir/opt/libelectron"
}
