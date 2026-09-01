# Maintainer: Thomas Lindae <thomas.lindae@in.tum.de>

pkgname=chameleos-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Screen annotation tool for niri and Hyprland'
arch=('x86_64' 'aarch64')
url='https://github.com/Treeniks/chameleos'
license=('GPL-3.0-or-later')
depends=('wayland')
makedepends=('git')
provides=('chameleos' 'chamel')
conflicts=('chameleos' 'chameleos-git')
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/chameleos-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/chameleos-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
options=(!debug)
sha256sums_x86_64=('2930b32ea8a6d22d02f893b2d1ca802eba9a4c95ac3d3a2348a06f21ce54433c')
sha256sums_aarch64=('7e61d0f799d5f3c3a612dc5ad8adb0e53455f3e714ca093af437a7a4857da689')

package() {
    cd "$srcdir"

    install -Dm755 "chameleos" "$pkgdir/usr/bin/chameleos"
    install -Dm755 "chamel" "$pkgdir/usr/bin/chamel"

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
