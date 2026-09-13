# Maintainer: Bendik Aagaard Lynghaug <bendik.lynghaug@gmail.com>
pkgname=gpupaper
pkgver=0.1.4
pkgrel=1
pkgdesc="Wayland layer-surface wallpaper runner powered by GLSL/WGSL fragment shaders (wgpu)"
arch=('x86_64' 'aarch64')
options=('!strip')
url="https://project.uhhm.no/bl/gpupaper"
license=('MIT')
depends=('wayland' 'libglvnd')
optdepends=(
    'vulkan-icd-loader: Vulkan backend (generic loader)'
    'mesa: open-source Vulkan/OpenGL for AMD, Intel, and Raspberry Pi'
    'nvidia-utils: NVIDIA Vulkan/OpenGL support'
)
provides=('gpupaper')
conflicts=('gpupaper-git' 'gpupaper-bin')
source_x86_64=("gpupaper-v${pkgver}-x86_64.tar.gz::https://project.uhhm.no/bl/gpupaper/releases/download/v${pkgver}/gpupaper-v${pkgver}-x86_64.tar.gz")
source_aarch64=("gpupaper-v${pkgver}-aarch64.tar.gz::https://project.uhhm.no/bl/gpupaper/releases/download/v${pkgver}/gpupaper-v${pkgver}-aarch64.tar.gz")
sha256sums_x86_64=('3ec7c0e733351c47fc3d4030e7a51483da9de20fc0fce4d13a201e2e7a60e0bb')
sha256sums_aarch64=('e5fe30eb629d277650950316ab03116a627288c876a94233e2189790d38af8a7')

package() {
    install -Dm755 gpupaper "$pkgdir/usr/bin/gpupaper"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -dm755 "$pkgdir/usr/share/gpupaper/shaders"
    install -Dm644 shaders/*.frag "$pkgdir/usr/share/gpupaper/shaders/"
}
