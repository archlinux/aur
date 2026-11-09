# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Stanislav Kovalenko <https://github.com/kovstas>
# Upstream author: Umputun <https://github.com/umputun>

pkgname=revdiff-bin
pkgver=1.15.0
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
            'e3ee80484911e8756fe5646d5ca0a4dd9c2b3fc8abe06963ce2417cb5e6c004b'
            '193c14b77d1ef8dccb2c01362894f91932684191adb2bb2b7768d787422c7a34')
sha256sums_x86_64=('d2bfcdeb5bd14011d487d57d4c9dc061a2c5e6fbda9658aa4636f3eaa3aefbe8')
sha256sums_aarch64=('25015da7ed2f34cbf04b543013f5345b6de36c5b7c9e53aba7931e54aabcbf4e')

package() {
    install -Dm755 revdiff -t "$pkgdir/usr/bin/"
    install -Dm644 "LICENSE-MIT-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "CLAUDE-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/CLAUDE.md"
    install -Dm644 completions/revdiff.bash "$pkgdir/usr/share/bash-completion/completions/revdiff"
    install -Dm644 completions/revdiff.zsh "$pkgdir/usr/share/zsh/site-functions/_revdiff"
    install -Dm644 completions/revdiff.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
}

