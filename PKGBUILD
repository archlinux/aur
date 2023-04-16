pkgname=libelectron
pkgver=1.0.11
pkgrel=1
arch=("x86_64" "aarch64")
url="https://gitlab.com/libelectron/libelectron"
license=('GPL')
depends=('npm' 'git')
pkgdesc="A collection of npm dependencies for electron packages."
makedepends=('unzip')
source=("https://gitlab.com/libelectron/libelectron/-/archive/1.0.11-1/libelectron-1.0.11-1.tar.bz2")
sha256sums=('SKIP')

package() {
        for dir in $pkgname-$pkgver-$pkgrel ; do mv "${dir}" "$pkgname" ;done
    cd "$srcdir/$pkgname"
    #chmod +x install
    ./setup 
    install -dm755 "$pkgdir/opt/libelectron"
    cp -r ./node_modules "$pkgdir/opt/libelectron"
}
