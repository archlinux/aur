# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=hstry
pkgver=0.5.8
pkgrel=1
pkgdesc="Universal AI chat history database with full-text search"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/hstry"
license=('MIT')
depends=('gcc-libs' 'sqlite')
optdepends=('bash: for shell completions' 'zsh: for shell completions')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/hstry/releases/download/v$pkgver/hstry-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/hstry/releases/download/v$pkgver/hstry-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('d73ca856f4229a6cb7e683c51a5a4524decab673a824946b777215598b657e74')
sha256sums_aarch64=('a4ad75b08828365f99a349c2ee8f5e1397aa3d9efa12eee7c8caa0b8156419f3')

package() {
    install -Dm755 hstry "$pkgdir/usr/bin/hstry"
    if [ -f "hstry-tui" ]; then
        install -Dm755 hstry-tui "$pkgdir/usr/bin/hstry-tui"
    fi
    if [ -f "hstry-mcp" ]; then
        install -Dm755 hstry-mcp "$pkgdir/usr/bin/hstry-mcp"
    fi
}
