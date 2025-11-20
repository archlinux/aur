# Maintainer: Thomas Lindae <thomas.lindae@in.tum.de>

pkgname=chameleos-bin
pkgver=0.1.2
pkgrel=1
pkgdesc='Screen annotation tool for niri and Hyprland'
arch=('x86_64' 'aarch64')
url='https://github.com/Treeniks/chameleos'
license=('MIT')
depends=('wayland')
makedepends=('git')
provides=('chameleos' 'chamel')
conflicts=('chameleos' 'chameleos-git')
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/chameleos-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/chameleos-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
options=(!debug)
sha256sums_x86_64=('bde54a857c1de24209d645dc6b008c95427edc99e649735882d1369550e007f5')
sha256sums_aarch64=('c537224fbfa4d8bfd490c7d50f72f25e4634878b88c347889f1373bcab81158f')

package() {
    cd "$srcdir"

    install -Dm755 "chameleos" "$pkgdir/usr/bin/chameleos"
    install -Dm755 "chamel" "$pkgdir/usr/bin/chamel"

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
