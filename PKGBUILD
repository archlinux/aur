# Maintainer: loathingkernel <loathingkernel @at gmail .dot com>

pkgname=d9vk-bin
pkgver=0.11
pkgrel=1
pkgdesc="A d3d9 to vk layer based off DXVK's codebase. Binary version"
arch=('x86_64')
url="https://github.com/Joshua-Ashton/d9vk"
license=('zlib/libpng')
depends=('vulkan-icd-loader' 'wine>=4.0rc1' 'lib32-vulkan-icd-loader' 'bash')
provides=("d9vk")
conflicts=("d9vk")
source=(
    "https://github.com/Joshua-Ashton/d9vk/releases/download/$pkgver/d9vk-release-$pkgver.2a0c153b0c9e0b754b9cfc41ea16c5bdc758fab5.zip"
    "setup_d9vk"
)
sha256sums=(
    "34adb56a75a20c0520db4365d5d29dfa4755439cf0c50dda1a4e56254e8278ef"
    "7147644664ef33d04f7b18683c47be95b5664c57cf6d63fdc019d915deebd37a"
)

package() {
    install -Dm 755 -t "$pkgdir/usr/share/d9vk" build/dxvk-release/setup_dxvk.sh
    mv build/dxvk-release/x32 "$pkgdir/usr/share/d9vk/"
    mv build/dxvk-release/x64 "$pkgdir/usr/share/d9vk/"
    install -Dm 755 -t "$pkgdir/usr/bin" setup_d9vk
}
