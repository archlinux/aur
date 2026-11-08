# Maintainer: Johan Larsson <johan@jolars.co>
pkgname=fatou-bin
pkgver=0.26.1
pkgrel=1
pkgdesc="A language server, formatter, and linter for Julia"
arch=('x86_64' 'aarch64')
url="https://github.com/jolars/fatou"
license=('MIT')
depends=('gcc-libs')
provides=('fatou')
conflicts=('fatou')
options=(!strip)
source_x86_64=("fatou-$pkgver-x86_64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/fatou-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("fatou-$pkgver-aarch64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/fatou-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('a53c468022dfd8124badfdb8bb6ca6dab8037d0178cb45115cd4505e3ad0706e')
sha256sums_aarch64=('62daba78ba7e17dec6cc325132eb271eeb509d6ccacfcad31ec8bd5433e4c4af')

package() {
    install -Dm755 fatou "$pkgdir/usr/bin/fatou"

    install -Dm644 man/*.1 -t "$pkgdir/usr/share/man/man1/"

    install -Dm644 completions/fatou.bash "$pkgdir/usr/share/bash-completion/completions/fatou"
    install -Dm644 completions/fatou.fish "$pkgdir/usr/share/fish/vendor_completions.d/fatou.fish"
    install -Dm644 completions/_fatou "$pkgdir/usr/share/zsh/site-functions/_fatou"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
