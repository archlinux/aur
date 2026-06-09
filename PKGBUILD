# Maintainer: Bendik Aagaard Lynghaug <bendik.lynghaug@gmail.com>
pkgname=gpupaper
pkgver=0.1.2
pkgrel=1
pkgdesc="Wayland layer-surface wallpaper runner powered by GLSL/WGSL fragment shaders (wgpu)"
arch=('x86_64' 'aarch64')
url="https://prosjekt.klingenbergbygg.no/bl/gpupaper"
license=('MIT')
depends=('wayland' 'libglvnd')
optdepends=(
    'vulkan-icd-loader: Vulkan backend (generic loader)'
    'mesa: open-source Vulkan/OpenGL for AMD, Intel, and Raspberry Pi'
    'nvidia-utils: NVIDIA Vulkan/OpenGL support'
)
provides=('gpupaper')
conflicts=('gpupaper-git' 'gpupaper-bin')
source_x86_64=("gpupaper-v${pkgver}-x86_64.tar.gz::https://prosjekt.klingenbergbygg.no/bl/gpupaper/releases/download/v${pkgver}/gpupaper-v${pkgver}-x86_64.tar.gz")
source_aarch64=("gpupaper-v${pkgver}-aarch64.tar.gz::https://prosjekt.klingenbergbygg.no/bl/gpupaper/releases/download/v${pkgver}/gpupaper-v${pkgver}-aarch64.tar.gz")
sha256sums_x86_64=('b1228e9892eecb6b7d81c50864e78f9965bb7b9c56376a5b44572b346bc6fb12')
sha256sums_aarch64=('843cbdb2ed6b08012d0c1b7f758408c2b786fe7ba03fffc9d6d7d16c03a55eaf')

package() {
    install -Dm755 gpupaper "$pkgdir/usr/bin/gpupaper"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -dm755 "$pkgdir/usr/share/gpupaper/shaders"
    install -Dm644 shaders/*.frag "$pkgdir/usr/share/gpupaper/shaders/"
}
