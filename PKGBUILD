# Maintainer: insmtr <insmtr@insmtr.cn>
pkgname=cargo-ament-build-bin
_pkgname=${pkgname%-bin}
pkgver=0.1.9
pkgrel=1
pkgdesc="Cargo plugin wrapper around cargo build for ament and ROS 2 tools"
arch=("x86_64" "aarch64")
url="https://github.com/ros2-rust/cargo-ament-build"
license=('Apache-2.0')
provides=(${_pkgname})
source_x86_64=($_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-gnu.tar.xz)
source_aarch64=($_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-aarch64-unknown-linux-gnu.tar.xz)
options=(!debug)
sha256sums_x86_64=('0396cc33de2fd45269ab674cf4877dfd60a689dc67b7b7a45b6193adb9a2e00d')
sha256sums_aarch64=('3ea9c830be688baaaa898b5667778efcbbde7dcd392b28b0429d62ac1802dd34')

package() {
    install -Dm755 $_pkgname*/cargo-ament-build $pkgdir/usr/bin/cargo-ament-build
}
