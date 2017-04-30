# Maintainer: Yamakaky <yamakaky@yamaworld.fr>
pkgname=rust-src
pkgver=1.17.0
pkgrel=1
pkgdesc="Rust source files"
arch=('any')
url="http://rust-lang.org"
license=('MIT' 'Apache')
options=(!strip)
source=("https://static.rust-lang.org/dist/rustc-$pkgver-src.tar.gz")
sha256sums=('4baba3895b75f2492df6ce5a28a916307ecd1c088dc1fd02dbfa8a8e86174f87')

prepare() {
    cd "rustc-${pkgver}-src"
    find . -type d -exec chmod 755 {} \;
    find . -type f -exec chmod 644 {} \;
}

package() {
    cd "rustc-${pkgver}-src"
    mkdir -p "$pkgdir/usr/src/rust/"
    cp -r * "$pkgdir/usr/src/rust/"
}
