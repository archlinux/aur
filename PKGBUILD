# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=hstry
pkgver=0.5.1
pkgrel=1
pkgdesc="Universal AI chat history database with full-text search"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/hstry"
license=('MIT')
depends=('gcc-libs' 'sqlite')
optdepends=('bash: for shell completions' 'zsh: for shell completions')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/hstry/releases/download/v$pkgver/hstry-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/hstry/releases/download/v$pkgver/hstry-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('3a2a0901e91158698816f6a1c019de0219a1f1be5099a9fd122a3e917338282d')
sha256sums_aarch64=('91c6448435ee45e8753cd4e571e08845586f3f06c60ca1bb255359ce3053a7bb')

package() {
    install -Dm755 hstry "$pkgdir/usr/bin/hstry"
    if [ -f "hstry-tui" ]; then
        install -Dm755 hstry-tui "$pkgdir/usr/bin/hstry-tui"
    fi
    if [ -f "hstry-mcp" ]; then
        install -Dm755 hstry-mcp "$pkgdir/usr/bin/hstry-mcp"
    fi
}
