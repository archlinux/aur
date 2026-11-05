# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Stanislav Kovalenko <https://github.com/kovstas>
# Upstream author: Umputun <https://github.com/umputun>

pkgname=revdiff-bin
pkgver=1.14.0
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
            'c0c6b98bcb51e296968bf724a85d97d938ca61c24c95b58cf7f200c887680ec1'
            '36726d9887ee15e6b7278dac424c6ba60dd7fa50f2592c6f7264bcfb80cc8967')
sha256sums_x86_64=('5df6e48e7ccbe212dc450be231df74e45c7a1979c59f428be7a2772b660777f8')
sha256sums_aarch64=('b6ef2e73cd3bbdd7bf8ece261b85a73fc5129417208685cd8fdc086088bd4ebd')

package() {
    install -Dm755 revdiff -t "$pkgdir/usr/bin/"
    install -Dm644 "LICENSE-MIT-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "CLAUDE-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/CLAUDE.md"
    install -Dm644 completions/revdiff.bash "$pkgdir/usr/share/bash-completion/completions/revdiff"
    install -Dm644 completions/revdiff.zsh "$pkgdir/usr/share/zsh/site-functions/_revdiff"
    install -Dm644 completions/revdiff.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
}

