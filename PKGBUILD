# Maintainer: Thomas Lindae <thomas.lindae@in.tum.de>

pkgname=chameleos-bin
pkgver=0.2.1
pkgrel=1
pkgdesc='Screen annotation tool for niri and Hyprland'
arch=('x86_64' 'aarch64')
url='https://github.com/Treeniks/chameleos'
license=('GPL-3.0-or-later')
depends=('wayland')
provides=('chameleos' 'chamel')
conflicts=('chameleos' 'chameleos-git')
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/chameleos-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/chameleos-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
options=(!debug)
sha256sums_x86_64=('b0d1b13729dedb8e1e6e898d2b50a3f74e8d4b01e0f24311e2309d7173ee128d')
sha256sums_aarch64=('dd6b6e658081186938d02bb1b83a954879a86f68dd621e89c8993f7f7bbbc964')

package() {
    cd "$srcdir"

    install -Dm755 "chameleos" "$pkgdir/usr/bin/chameleos"
    install -Dm755 "chamel" "$pkgdir/usr/bin/chamel"

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
