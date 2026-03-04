# Maintainer: Mads Thines Coello <madsthines@gmail.com>
pkgname=gw-tools
pkgver=0.27.0
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

sha256sums_x86_64=('ab807c97d14f2d4e0c7fdd8d61fdafdaa374fff630fb9433bd82a39fc9c937ea')
sha256sums_aarch64=('1a665f7062422bddb2796647875c6c0da5faa7edb8d5ca480ddbfaa6153ca3a4')

package() {
    if [ "$CARCH" = "x86_64" ]; then
        install -Dm755 "$srcdir/$pkgname-$pkgver-x64" "$pkgdir/usr/bin/gw"
    else
        install -Dm755 "$srcdir/$pkgname-$pkgver-arm64" "$pkgdir/usr/bin/gw"
    fi
}
