# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Stanislav Kovalenko <https://github.com/kovstas>
# Upstream author: Umputun <https://github.com/umputun>

pkgname=revdiff-bin
pkgver=1.11.1
pkgrel=1
pkgdesc="TUI for reviewing diffs, files, and documents with inline annotations"
arch=(x86_64 aarch64)
url="https://github.com/umputun/revdiff"
license=(MIT)
depends=(glibc)
provides=(revdiff)
conflicts=(revdiff)
source=("LICENSE-MIT-$pkgver::$url/raw/v$pkgver/LICENSE"
        "README-$pkgver.md::$url/raw/v$pkgver/README.md"
        "CLAUDE-$pkgver.md::$url/raw/v$pkgver/CLAUDE.md")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/revdiff_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/revdiff_${pkgver}_linux_arm64.tar.gz")
sha256sums=('155d97114b2d9b7f66181d0ba258aca57f97b8b957dd1662745bf57218c41ef3'
            '85b8591a8aad9144f6bb87526a5f1847a5e7c4807113c3efff7774bca56e7c0c'
            '7480dfc603fdcf3ac9ea2b660fd0c1a2ed1c6e4426476ba9c08f348798667990')
sha256sums_x86_64=('7958a6bef723267fed18b0be96476bb767636afe966338ed7e370c0a506fd54c')
sha256sums_aarch64=('87c522516e2d0ef113b74ff729a1e9072aad9958f1aeb6836b90d2b8fa2e0762')

package() {
    install -Dm755 revdiff -t "$pkgdir/usr/bin/"
    install -Dm644 "LICENSE-MIT-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "CLAUDE-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/CLAUDE.md"
    install -Dm644 completions/revdiff.bash "$pkgdir/usr/share/bash-completion/completions/revdiff"
    install -Dm644 completions/revdiff.zsh "$pkgdir/usr/share/zsh/site-functions/_revdiff"
    install -Dm644 completions/revdiff.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
}

