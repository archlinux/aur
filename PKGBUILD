# Maintainer: Mads Thines Coello <madsthines@gmail.com>
pkgname=gw-tools
pkgver=0.25.0
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

sha256sums_x86_64=('263f17df34aad2f481c761c953f3006566c8bf3bdbef897dece2e8af9faec156')
sha256sums_aarch64=('ce0495a916fcb85d26bab019fc356c4561f5f9f63c38a2a866426b84fc445016')

package() {
    if [ "$CARCH" = "x86_64" ]; then
        install -Dm755 "$srcdir/$pkgname-$pkgver-x64" "$pkgdir/usr/bin/gw"
    else
        install -Dm755 "$srcdir/$pkgname-$pkgver-arm64" "$pkgdir/usr/bin/gw"
    fi
}
