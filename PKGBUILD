# Maintainer: Johan Larsson <johan@jolars.co>
pkgname=fatou-bin
pkgver=0.23.0
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
sha256sums_x86_64=('8e2119bb3baddd1c0376fdbcc0becf3bcc4b114bd401197434796d1fe24beea0')
sha256sums_aarch64=('16b93a32b04be4e95e0b29f64f1b42315c334a4646de50876faaa42e2ecd7bde')

package() {
    install -Dm755 fatou "$pkgdir/usr/bin/fatou"

    install -Dm644 man/*.1 -t "$pkgdir/usr/share/man/man1/"

    install -Dm644 completions/fatou.bash "$pkgdir/usr/share/bash-completion/completions/fatou"
    install -Dm644 completions/fatou.fish "$pkgdir/usr/share/fish/vendor_completions.d/fatou.fish"
    install -Dm644 completions/_fatou "$pkgdir/usr/share/zsh/site-functions/_fatou"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
