# Maintainer: Johan Larsson <johan@jolars.co>
pkgname=panache-bin
pkgver=3.17.1
pkgrel=1
pkgdesc="A language server, formatter, and linter for Quarto and other Markdown flavors"
arch=('x86_64' 'aarch64')
url="https://github.com/jolars/panache"
license=('MIT')
depends=('gcc-libs')
provides=('panache')
conflicts=('panache')
options=(!strip)
source_x86_64=("panache-$pkgver-x86_64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/panache-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("panache-$pkgver-aarch64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/panache-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('64509993b0eb4091fc34a0f667565377af29436014bbba05947b327a275013b6')
sha256sums_aarch64=('a14dac6febe97e697963f706bdad5fd27d98d4364d1b25e53917ab5d41ac12fc')

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
