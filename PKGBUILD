# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Stanislav Kovalenko <https://github.com/kovstas>
# Upstream author: Umputun <https://github.com/umputun>

pkgname=revdiff-bin
pkgver=1.12.0
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
            'cde46c44fd8bd257356c624bbd4286c8597802b69c53ab474630e3c5d4804dbc'
            '23318ee8bc3ae7aa5c95c7b87b6ac6056a0e5f202579bc974a14452307543d96')
sha256sums_x86_64=('3b36478c3b9d6c6f5557515fed876e88ce1c3d14564714a3ed5aefb903cc7154')
sha256sums_aarch64=('57ab7e55b7d5b9f0cd03935946d333a66ddc4fd4efe019b987e185a72fc354e1')

package() {
    install -Dm755 revdiff -t "$pkgdir/usr/bin/"
    install -Dm644 "LICENSE-MIT-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "CLAUDE-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/CLAUDE.md"
    install -Dm644 completions/revdiff.bash "$pkgdir/usr/share/bash-completion/completions/revdiff"
    install -Dm644 completions/revdiff.zsh "$pkgdir/usr/share/zsh/site-functions/_revdiff"
    install -Dm644 completions/revdiff.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
}

