# Maintainer: Thomas Lindae <thomas.lindae@in.tum.de>

pkgname=chameleos-bin
pkgver=0.1.0
pkgrel=2
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
sha256sums_x86_64=('508599e56c22c30c600ddda19e65c5b809c37f6bfdd4acbd7b3f4a29d594eaee')
sha256sums_aarch64=('03a24eea3b1ab30e731e5e07a5838fbf84f7a3fbfe4d03c84c2e47152ec5630b')

package() {
    cd "$srcdir"

    install -Dm755 "chameleos" "$pkgdir/usr/bin/chameleos"
    install -Dm755 "chamel" "$pkgdir/usr/bin/chamel"

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
