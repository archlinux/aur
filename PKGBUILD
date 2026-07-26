# Maintainer: Meron Bossin Meronbssn@gmail.com
pkgname=mcat-bin
pkgver=0.6.3
pkgrel=2
pkgdesc="Terminal image, video, and Markdown viewer"
arch=('x86_64' 'aarch64')
url="https://github.com/Skardyy/mcat"
license=('MIT')
depends=('gcc-libs')
provides=('mcat')
conflicts=('mcat')

source_x86_64=("https://github.com/Skardyy/mcat/releases/download/v$pkgver/mcat-v$pkgver-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("https://github.com/Skardyy/mcat/releases/download/v$pkgver/mcat-v$pkgver-aarch64-unknown-linux-gnu.tar.xz")

sha256sums_x86_64=('9b4543f2a583fbe760ec94271828735a08a097e8f605c3ee754cb887b45eac1b')
sha256sums_aarch64=('badc967ed0ad136f089b69d619fcf6331e7e7277573c6d0e5e15ba4601cde0cf')

package() {
    cd "$srcdir/mcat-v$pkgver-$CARCH-unknown-linux-gnu"

    install -Dm755 mcat "$pkgdir/usr/bin/mcat"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"

    install -Dm644 "completions/_mcat" "$pkgdir/usr/share/zsh/site-functions/_mcat"
    install -Dm644 "completions/mcat.bash" "$pkgdir/usr/share/bash-completion/completions/mcat"
    install -Dm644 "completions/mcat.fish" "$pkgdir/usr/share/fish/vendor_completions.d/mcat.fish"
}
