# Maintainer: Meron Bossin Meronbssn@gmail.com
pkgname=mcat-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="Terminal image, video, and Markdown viewer"
arch=('x86_64' 'aarch64')
url="https://github.com/Skardyy/mcat"
license=('MIT')
depends=()
provides=('mcat')
conflicts=('mcat')

source_x86_64=("https://github.com/Skardyy/mcat/releases/download/v$pkgver/mcat-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("https://github.com/Skardyy/mcat/releases/download/v$pkgver/mcat-aarch64-unknown-linux-gnu.tar.xz")

sha256sums_x86_64=('b7d6cdb499e17136d136aebc9ef478d4e5c3806f7b5fac7e84520d189b5fc71e')
sha256sums_aarch64=('f6804d932540eb3ff012874ec3d4f291c8cf9d06e4dcd5d609d1300c54c28046')

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
