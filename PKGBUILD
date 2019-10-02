# Maintainer: loathingkernel <loathingkernel @at gmail .dot com>

pkgname=d9vk-bin
pkgver=0.22
pkgrel=1
pkgdesc="A d3d9 to vk layer based off DXVK's codebase. Binary version"
arch=('x86_64')
url="https://github.com/Joshua-Ashton/d9vk"
license=('zlib/libpng')
depends=('vulkan-icd-loader' 'wine>=4.0rc1' 'lib32-vulkan-icd-loader' 'bash')
provides=("d9vk")
conflicts=("d9vk")
source=(
    "https://github.com/Joshua-Ashton/d9vk/releases/download/$pkgver/d9vk-$pkgver.tar.gz"
    "setup_d9vk"
)
sha256sums=(
    "45d2b5d20cd6d96a43673b999814d3d9d3e64360a514757df3ef49b9a28ae65a"
    "7147644664ef33d04f7b18683c47be95b5664c57cf6d63fdc019d915deebd37a"
)

package() {
    install -Dm 755 -t "$pkgdir/usr/share/d9vk" d9vk-$pkgver/setup_dxvk.sh
    mv d9vk-$pkgver/x32 "$pkgdir/usr/share/d9vk/"
    mv d9vk-$pkgver/x64 "$pkgdir/usr/share/d9vk/"
    install -Dm 755 -t "$pkgdir/usr/bin" setup_d9vk
}
