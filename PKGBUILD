# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=hstry
pkgver=0.5.2
pkgrel=1
pkgdesc="Universal AI chat history database with full-text search"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/hstry"
license=('MIT')
depends=('gcc-libs' 'sqlite')
optdepends=('bash: for shell completions' 'zsh: for shell completions')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/hstry/releases/download/v$pkgver/hstry-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/hstry/releases/download/v$pkgver/hstry-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('814f8e60b1d3ddf022b6e0aab95642be10c1275725a06593f94fa03963aa0a33')
sha256sums_aarch64=('97fce979dde45b6387ed719c83373774a862110446b9e267e7a0101b7928d198')

package() {
    install -Dm755 hstry "$pkgdir/usr/bin/hstry"
    if [ -f "hstry-tui" ]; then
        install -Dm755 hstry-tui "$pkgdir/usr/bin/hstry-tui"
    fi
    if [ -f "hstry-mcp" ]; then
        install -Dm755 hstry-mcp "$pkgdir/usr/bin/hstry-mcp"
    fi
}
