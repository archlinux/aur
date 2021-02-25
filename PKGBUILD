# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Radoslaw Mejer <radmen@radmen.info>
pkgname=silicon
pkgver=0.4.0
pkgrel=3
depends=('fontconfig' 'freetype2' 'xclip')
makedepends=('rust' 'cargo' 'glibc' 'llvm-libs' 'gcc-libs' 'clang' 'python')
arch=('x86_64')
pkgdesc="Create beautiful image of your code"
license=('MIT')
url="https://github.com/Aloxaf/silicon"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Aloxaf/silicon/archive/v$pkgver.tar.gz")
sha256sums=('423c03d9c92cbad8f5a136abaa680e85dfa5b5f31998aab4424c335d4d99b7ab')

build() {
    cd "$srcdir/silicon-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$srcdir/silicon-$pkgver"
    install -Dm755 "target/release/silicon" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
