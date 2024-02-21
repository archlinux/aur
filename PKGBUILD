# Maintainer: Phil Ruffwind <rf@rufflewind.com>
# Contributor: Jonas Platte <aur@jonasplatte.de>
pkgname=purescript-bin
pkgver=0.15.15
pkgrel=1
pkgdesc="A strongly-typed functional programming language that compiles to JavaScript"
arch=(aarch64 x86_64)
url=http://www.purescript.org
license=(BSD)
depends=(gmp ncurses5-compat-libs zlib)
provides=(purescript)
conflicts=(purescript)
source_aarch64=(purescript-v$pkgver-linux-arm64.tar.gz::https://github.com/purescript/purescript/releases/download/v$pkgver/linux-arm64.tar.gz)
source_x86_64=(purescript-v$pkgver-linux64.tar.gz::https://github.com/purescript/purescript/releases/download/v$pkgver/linux64.tar.gz)
sha1sums_aarch64=('4fb707c71f52f98ea369402ae1a945a43c523578')
sha1sums_x86_64=('acca7d792b95f66af8c62f261775ef1b6fb0e92c')

package() {
    cd "$srcdir/purescript"
    find . -type f -perm -a=x -print0 | while read -r -d '' f; do
        install -Dm755 "$f" "$pkgdir/usr/bin/$f"
    done
    install -Dm644 "$srcdir/purescript/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
