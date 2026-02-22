# Maintainer: Mads Thines Coello <madsthines@gmail.com>
pkgname=gw-tools
pkgver=0.20.14
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

sha256sums_x86_64=('18120a995a2b18ab8fae5224f318f4f3db8a16909a204b2ffd083a032452f222')
sha256sums_aarch64=('2e84f19e91f39dee8b3ba2b00dccc35ac92392a0c9b05c05e54213010f181e47')

package() {
    if [ "$CARCH" = "x86_64" ]; then
        install -Dm755 "$srcdir/$pkgname-$pkgver-x64" "$pkgdir/usr/bin/gw"
    else
        install -Dm755 "$srcdir/$pkgname-$pkgver-arm64" "$pkgdir/usr/bin/gw"
    fi
}
