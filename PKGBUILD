# Maintainer: Thomas Lindae <thomas.lindae@in.tum.de>

pkgname=chameleos-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Screen annotation tool for niri and Hyprland'
arch=('x86_64' 'aarch64')
url='https://github.com/Treeniks/chameleos'
license=('MIT')
depends=('wayland')
makedepends=('git')
provides=('chameleos' 'chamel')
conflicts=('chameleos' 'chameleos-git')
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/chameleos-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/chameleos-$pkgver-aarch64-unknown-linux-gnu.tar.gz")
options=(!debug)
sha256sums_x86_64=('190ddb77cabcffb7d9e662df472bacfa44ccd25ff619e7d8ac607ba3391dc988')
sha256sums_aarch64=('dcdb6387d59bde098dde32dccb6efb855542ba8fcca44a6c1f29f9cb449020cb')

package() {
    cd "$srcdir"

    install -Dm755 "chameleos" "$pkgdir/usr/bin/chameleos"
    install -Dm755 "chamel" "$pkgdir/usr/bin/chamel"

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
