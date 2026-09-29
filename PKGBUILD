# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=hstry
pkgver=0.5.26
pkgrel=1
pkgdesc="Universal AI chat history database with full-text search"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/hstry"
license=('MIT')
depends=('gcc-libs' 'sqlite')
optdepends=('bash: for shell completions' 'zsh: for shell completions')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/hstry/releases/download/v$pkgver/hstry-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/hstry/releases/download/v$pkgver/hstry-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('3c97a80d521f489e0e513c1f1ed5c6ef732702c000c2d16b74411f03e72d04fb')
sha256sums_aarch64=('828ef62c44465d154a523b001dcc8e2bdbff8815732d7e1ca1ec06545c4e7cc4')

package() {
    install -Dm755 hstry "$pkgdir/usr/bin/hstry"
    if [ -f "hstry-tui" ]; then
        install -Dm755 hstry-tui "$pkgdir/usr/bin/hstry-tui"
    fi
    if [ -f "hstry-mcp" ]; then
        install -Dm755 hstry-mcp "$pkgdir/usr/bin/hstry-mcp"
    fi
}
