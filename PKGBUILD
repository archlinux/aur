# Maintainer: Yamakaky <yamakaky@yamaworld.fr>
pkgname=rust-src
pkgver=1.13.0
pkgrel=1
pkgdesc="Rust source files"
arch=('any')
url="http://rust-lang.org"
license=('MIT' 'Apache')
options=(!strip)
source=("https://static.rust-lang.org/dist/rustc-$pkgver-src.tar.gz")
sha256sums=('ecb84775ca977a5efec14d0cad19621a155bfcbbf46e8050d18721bb1e3e5084')

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
