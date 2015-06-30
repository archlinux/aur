# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=rust-src
pkgver=1.1.0
pkgrel=1
pkgdesc="Rust source files"
arch=('any')
url="http://rust-lang.org"
license=('MIT' 'Apache')
options=(!strip)
source=("https://static.rust-lang.org/dist/rustc-$pkgver-src.tar.gz")
sha1sums=('a9913667b60ebf8dc558baa14ab1a59ceb4f76ef')

package() {
    cd "rustc-$pkgver"
    find . -type d -exec chmod 755 {} \;
    find . -type f -exec chmod 644 {} \;
    mkdir -p "$pkgdir/usr/src/rust/"
    cp -r * "$pkgdir/usr/src/rust/"
}
