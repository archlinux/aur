# Maintainer: Phil Ruffwind <rf@rufflewind.com>
# Contributor: Jonas Platte <aur@jonasplatte.de>
pkgname=purescript-bin
pkgver=0.13.5
pkgrel=1
pkgdesc="A strongly-typed functional programming language that compiles to JavaScript"
arch=(x86_64)
url=http://www.purescript.org
license=(BSD)
depends=(gmp ncurses5-compat-libs zlib)
provides=(purescript)
conflicts=(purescript)
source=(purescript-v$pkgver-linux64.tar.gz::https://github.com/purescript/purescript/releases/download/v$pkgver/linux64.tar.gz)
sha1sums=('58b14014ba08ef6550fa61700797688d27a9a2f3')

package() {
    cd "$srcdir/purescript/$f"
    find . -type f -perm -a=x -print0 | while read -r -d '' f; do
        install -Dm755 "$f" "$pkgdir/usr/bin/$f"
    done
    install -Dm644 "$srcdir/purescript/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
