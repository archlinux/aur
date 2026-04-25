# Maintainer: Meron Bossin Meronbssn@gmail.com
pkgname=mcat-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Terminal image, video, and Markdown viewer"
arch=('x86_64' 'aarch64')
url="https://github.com/Skardyy/mcat"
license=('MIT')
depends=('gcc-libs')
provides=('mcat')
conflicts=('mcat')

source_x86_64=("https://github.com/Skardyy/mcat/releases/download/v$pkgver/mcat-v$pkgver-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("https://github.com/Skardyy/mcat/releases/download/v$pkgver/mcat-v$pkgver-aarch64-unknown-linux-gnu.tar.xz")

sha256sums_x86_64=('c04707791b81142042cfbaeceda6ad26fe9d52d868584a655a3b57555ff944bd')
sha256sums_aarch64=('20db061b0113e10b54bb69dcb7579c87e45f982e91e9ded0a9b6b914c257070e')

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
