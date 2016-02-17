# Maintainer: Yamakaky <yamakaky@yamaworld.fr>
pkgname=rust-nightly-src
pkgver=1.8.0
pkgrel=1
pkgdesc="Rust source files"
arch=('any')
url="http://rust-lang.org"
license=('MIT' 'Apache')
options=(!strip)
conflicts=('rust-src')
source=("https://static.rust-lang.org/dist/rustc-nightly-src.tar.gz")
sha256sums=('63942701b8f1e1b063d12bad7e90c4d77c354a427a27aa6e97d30896b84cc7b2')

prepare() {
    cd "rustc-nightly"
    find . -type d -exec chmod 755 {} \;
    find . -type f -exec chmod 644 {} \;
}

package() {
    cd "rustc-nightly"
    mkdir -p "$pkgdir/usr/src/rust/"
    cp -r * "$pkgdir/usr/src/rust/"
}
