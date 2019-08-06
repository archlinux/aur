# Maintainer: Radoslaw Mejer <radmen@radmen.info>
pkgname=silicon
pkgver=0.2.6
pkgrel=1
depends=('fontconfig' 'freetype2' 'xclip')
makedepends=('rust' 'cargo' 'glibc' 'llvm-libs' 'gcc-libs')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Create beautiful image of your code"
license=('MIT')
source=(
    "https://github.com/Aloxaf/silicon/archive/v$pkgver.tar.gz"
)
sha256sums=(
    '203e004bb5ad7eafabdc1341a93b3ab490a01c4edd4dd16374874ef5d6dec9b2'
)

build() {
    return 0
}

package() {
    cargo install --root="$pkgdir/usr" --path "$srcdir/silicon-$pkgver"
    install -Dm644 "$srcdir/silicon-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    rm -f "$pkgdir/usr/.crates.toml"
}
