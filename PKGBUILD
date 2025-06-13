pkgname=libelectron
pkgver=2025.5
pkgrel=2
arch=("x86_64" "aarch64")
url="https://gitlab.com/linuxbombay/libelectron/libelectron"
license=('GPL')
electronver="electron36"
depends=('npm' '$electronver' 'git' 'icu')
pkgdesc="A collection of npm dependencies for electron packages."
makedepends=('unzip')
source=("$url/-/archive/$pkgver/libelectron-$pkgver.tar.bz2")
sha256sums=('ffaadb9ae66d8f79041111012522cdf997265e5d8bec8071d7ce7212afc6662e')

package() {
    for dir in $pkgname-$pkgver ; do mv "${dir}" "$pkgname" ;done
    cd "$srcdir/$pkgname"
    ./setup 
    install -dm755 "$pkgdir/opt/libelectron"
    ln -s "/usr/lib/$electronver/electron" "$pkgdir/opt/libelectron"
    cp -r "$srcdir/libelectron/node_modules" "$pkgdir/opt/libelectron"
}
