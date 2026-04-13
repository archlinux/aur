pkgname=panache-bin
pkgver=2.33.0
pkgrel=1
pkgdesc="A language server, formatter, and linter for Pandoc, Quarto, and R Markdown"
arch=('x86_64' 'aarch64')
url="https://github.com/jolars/panache"
license=('MIT')
depends=('gcc-libs')
provides=('panache')
conflicts=('panache')
options=(!strip)
source_x86_64=("panache-$pkgver-x86_64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/panache-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("panache-$pkgver-aarch64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/panache-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('51ef8a8a01787b04564baafa5ea7797103133c54abc3c3254585ed107ae9476d')
sha256sums_aarch64=('a51542fb95965845212e0556cada95fe9749eaec3e3733e8a1182f7307e5d1e4')

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
