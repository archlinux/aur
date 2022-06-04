# Maintainer: Juliette Cordor
pkgname=ignoreit
pkgver=2.4.2
pkgrel=1
url="https://github.com/jewlexx/ignoreit"
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Quickly load .gitignore templates"
license=('MIT')
source=(
    "$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
)

sha256sums=('4bcb5d8fcc504cf92a475fd5c785a86383d1402bf3599c63ad346c24a06caed9')

build() {
    return 0
}

package() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo install --no-track --all-features --root="$pkgdir/usr/" --path .
}
