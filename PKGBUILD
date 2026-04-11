# Maintainer: Meron Bossin Meronbssn@gmail.com
pkgname=mcat-bin
pkgver=0.5.5
pkgrel=1
pkgdesc="Terminal image, video, and Markdown viewer"
arch=('x86_64' 'aarch64')
url="https://github.com/Skardyy/mcat"
license=('MIT')
depends=('gcc-libs')
provides=('mcat')
conflicts=('mcat')

source_x86_64=("https://github.com/Skardyy/mcat/releases/download/v$pkgver/mcat-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("https://github.com/Skardyy/mcat/releases/download/v$pkgver/mcat-aarch64-unknown-linux-gnu.tar.xz")

sha256sums_x86_64=('843747445289602f5f97df3ff8db91e7749dfe928cabaf82b741d367c0137e5c')
sha256sums_aarch64=('d20142f321b22a5e58293e1a10ee4fa02cc812b13080f70601f56fd16bb592e2')

package() {
    cd "$srcdir/mcat-$CARCH-unknown-linux-gnu"

    install -Dm755 mcat "$pkgdir/usr/bin/mcat"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"

    install -Dm644 "completions/_mcat" "$pkgdir/usr/share/zsh/site-functions/_mcat"
    install -Dm644 "completions/mcat.bash" "$pkgdir/usr/share/bash-completion/completions/mcat"
    install -Dm644 "completions/mcat.fish" "$pkgdir/usr/share/fish/vendor_completions.d/mcat.fish"
}
