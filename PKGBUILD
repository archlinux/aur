pkgname=panache-bin
pkgver=2.34.0
pkgrel=1
pkgdesc="A language server, formatter, and linter for Pandoc, Quarto, and R Markdown"
arch=('x86_64' 'aarch64')
url="https://github.com/jolars/panache"
license=('MIT')
depends=('gcc-libs')
provides=('panache')
conflicts=('panache')
options=(!strip)
source_x86_64=("panache-$pkgver-x86_64-unknown-linux-gnu.tar.gz::$url/releases/download/panache-v$pkgver/panache-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("panache-$pkgver-aarch64-unknown-linux-gnu.tar.gz::$url/releases/download/panache-v$pkgver/panache-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('802e7034dca0b75b4d41c392208f486fc78561634ad62318fcffce1bb1c2ce6d')
sha256sums_aarch64=('685a88670dd6268c19c01b86b56a4c9077732f688c37b89db321f45ea5d2ef45')

package() {
    # Binary
    install -Dm755 panache "$pkgdir/usr/bin/panache"

    # Man pages
    install -Dm644 man/*.1 -t "$pkgdir/usr/share/man/man1/"

    # Shell completions
    install -Dm644 completions/panache.bash "$pkgdir/usr/share/bash-completion/completions/panache"
    install -Dm644 completions/panache.fish "$pkgdir/usr/share/fish/vendor_completions.d/panache.fish"
    install -Dm644 completions/_panache "$pkgdir/usr/share/zsh/site-functions/_panache"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
