# Maintainer: Yamakaky <yamakaky@yamaworld.fr>
pkgname=rust-src
pkgver=1.11.0
pkgrel=1
pkgdesc="Rust source files"
arch=('any')
url="http://rust-lang.org"
license=('MIT' 'Apache')
options=(!strip)
source=("https://static.rust-lang.org/dist/rustc-$pkgver-src.tar.gz")
sha256sums=('3685034a78e70637bdfa3117619f759f2481002fd9abbc78cc0f737c9974de6a')

prepare() {
    cd "rustc-$pkgver"
    find . -type d -exec chmod 755 {} \;
    find . -type f -exec chmod 644 {} \;
}

package() {
    cd "rustc-$pkgver"
    mkdir -p "$pkgdir/usr/src/rust/"
    cp -r * "$pkgdir/usr/src/rust/"
}
