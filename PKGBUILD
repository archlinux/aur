# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Stanislav Kovalenko <https://github.com/kovstas>
# Upstream author: Umputun <https://github.com/umputun>

pkgname=revdiff-bin
pkgver=1.13.0
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
            'ae9100afb2bf060a6e67f131e09be010673103881c2f01cce5d7e8ec2b7b53c6'
            '255ddeb87fd05ac7cc518fa16cad8f95c8d7d5d71b7ae908b7f4a736659def0a')
sha256sums_x86_64=('6cc2fcbdcb2e865a7063945f0735f69916f68cc21a886854217233c793edb4c7')
sha256sums_aarch64=('40492aeb36a57f10c2bca1a5cc95fae869d7236bfb04efb7d9d1c3d82851aff5')

package() {
    install -Dm755 revdiff -t "$pkgdir/usr/bin/"
    install -Dm644 "LICENSE-MIT-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "CLAUDE-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/CLAUDE.md"
    install -Dm644 completions/revdiff.bash "$pkgdir/usr/share/bash-completion/completions/revdiff"
    install -Dm644 completions/revdiff.zsh "$pkgdir/usr/share/zsh/site-functions/_revdiff"
    install -Dm644 completions/revdiff.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
}

