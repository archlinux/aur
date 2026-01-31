# Maintainer: Eric Vogt <eric@vogt.dev>
pkgname=ghostty-quick
pkgver=1.0.0
pkgrel=1
pkgdesc="Dropdown terminal with persistent multiplexer session for Ghostty"
arch=('any')
url="https://github.com/EricVogt93/ghostty-quick"
license=('MIT')
depends=('bash')
optdepends=(
    'ghostty: terminal emulator'
    'zellij: terminal multiplexer'
    'tmux: terminal multiplexer'
    'jq: for hyprland monitor detection'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/EricVogt93/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('974809802d50eb73fe7386fbbafbf035c8ca0c41ccf69022644b9985a5fc0331')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 bin/ghostty-quick "$pkgdir/usr/bin/ghostty-quick"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
