pkgname=libelectron
pkgver=1.0.24
pkgrel=1
arch=("x86_64" "aarch64")
url="https://gitlab.com/linuxbombay/libelectron/libelectron"
license=('GPL')
depends=('npm' 'git' 'icu')
pkgdesc="A collection of npm dependencies for electron packages."
makedepends=('unzip')
source=("$url/-/archive/$pkgver/libelectron-$pkgver.tar.bz2")
sha256sums=('ced477508e8f7e862f8d16cf348f66cd3ff4e852e85de4426565ba4a8d46f2e4')

package() {
    for dir in $pkgname-$pkgver ; do mv "${dir}" "$pkgname" ;done
    cd "$srcdir/$pkgname"
    ./setup 
    install -dm755 "$pkgdir/opt/libelectron"
    cp -r "$srcdir/libelectron/node_modules" "$pkgdir/opt/libelectron"
}
