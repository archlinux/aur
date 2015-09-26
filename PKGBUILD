# Maintainer: Yamakaky <yamakaky@yamaworld.fr>
pkgname=rust-src
pkgver=1.3.0
pkgrel=1
pkgdesc="Rust source files"
arch=('any')
url="http://rust-lang.org"
license=('MIT' 'Apache')
options=(!strip)
source=("https://static.rust-lang.org/dist/rustc-$pkgver-src.tar.gz")
sha1sums=('184bda662c595fd16a2d3ca6075496ac3cdba9e5')

package() {
    cd "rustc-$pkgver"
    find . -type d -exec chmod 755 {} \;
    find . -type f -exec chmod 644 {} \;
    mkdir -p "$pkgdir/usr/src/rust/"
    cp -r * "$pkgdir/usr/src/rust/"
}
