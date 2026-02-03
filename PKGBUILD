# Maintainer: Mads Thines Coello <madsthines@gmail.com>
pkgname=gw-tools
pkgver=0.13.16
pkgrel=1
pkgdesc="Git worktree manager - Streamline your multi-branch development workflow"
arch=('x86_64' 'aarch64')
url="https://github.com/mthines/gw-tools"
license=('MIT')
options=('!strip')
provides=('gw')
conflicts=('gw')

source_x86_64=("$pkgname-$pkgver-x64::$url/releases/download/v$pkgver/gw-linux-x64")
source_aarch64=("$pkgname-$pkgver-arm64::$url/releases/download/v$pkgver/gw-linux-arm64")

sha256sums_x86_64=('68423a895e350bfb5771dbf864b2e5df65ef665211b9006ef6f474a0950a3dc8')
sha256sums_aarch64=('0ee7a83ee79bcd31fb2700e49c984bc20a7d9d45432e0c75fcfa99a5965971fb')

package() {
    if [ "$CARCH" = "x86_64" ]; then
        install -Dm755 "$srcdir/$pkgname-$pkgver-x64" "$pkgdir/usr/bin/gw"
    else
        install -Dm755 "$srcdir/$pkgname-$pkgver-arm64" "$pkgdir/usr/bin/gw"
    fi
}
