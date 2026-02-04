# Maintainer: Mads Thines Coello <madsthines@gmail.com>
pkgname=gw-tools
pkgver=0.14.4
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

sha256sums_x86_64=('4914ce3bbef92844807cccd84e9e0e01392a6390f9c8ce13a4ab2ca98dc8450e')
sha256sums_aarch64=('3682d2931b85d2fca4a94f2da3af4b2429da3a4e16aa59a208569334f3b6f498')

package() {
    if [ "$CARCH" = "x86_64" ]; then
        install -Dm755 "$srcdir/$pkgname-$pkgver-x64" "$pkgdir/usr/bin/gw"
    else
        install -Dm755 "$srcdir/$pkgname-$pkgver-arm64" "$pkgdir/usr/bin/gw"
    fi
}
