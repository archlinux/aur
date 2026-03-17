# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=trx-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Minimal git-backed issue tracker with TUI viewer"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/trx"
license=('MIT')
provides=('trx')
conflicts=('trx' 'trx-git')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/trx/releases/download/v$pkgver/trx-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/trx/releases/download/v$pkgver/trx-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('3c587ef35f17884a6aa6f49450dfffd23389ca402bba07790627e6916f14dea8')
sha256sums_aarch64=('3cbb92175a984b1e3160c720190ad98f9a7d68f401f7231f05ef7f7a7b3e5fee')

package() {
    install -Dm755 trx "$pkgdir/usr/bin/trx"
    [ -f trx-tui ] && install -Dm755 trx-tui "$pkgdir/usr/bin/trx-tui"
    [ -f trx-mcp ] && install -Dm755 trx-mcp "$pkgdir/usr/bin/trx-mcp"
    [ -f trx-api ] && install -Dm755 trx-api "$pkgdir/usr/bin/trx-api"
    return 0
}
