pkgname=panache-bin
pkgver=2.17.0
pkgrel=1
pkgdesc="A language server, formatter, and linter for Pandoc, Quarto, and R Markdown"
arch=('x86_64' 'aarch64')
url="https://github.com/jolars/panache"
license=('MIT')
depends=('gcc-libs')
provides=('panache')
conflicts=('panache')
source_x86_64=("$url/releases/download/v$pkgver/panache-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/panache-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('be3a4151f077fc6811e6a8aee518273b982b0437a5b5e374a216ff90bc1b272b')
sha256sums_aarch64=('fb5dfa8a2e036ff9f8a7654c86ad277780ad00114201be1cc77a0a720550ee38')

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
