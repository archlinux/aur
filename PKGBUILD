# Maintainer: Bendik Aagaard Lynghaug <bendik.lynghaug@gmail.com>
pkgname=gpupaper
pkgver=0.1.6
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
sha256sums_x86_64=('e6f09ba7cddf387504c07af5840dc9dac84c4d471f2db42a45219aeb5fe2b983')
sha256sums_aarch64=('ab6d9bfa60f218931382788cff601c60f46e45fe9ee680d8fa226a2adc168779')

package() {
    install -Dm755 gpupaper "$pkgdir/usr/bin/gpupaper"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -dm755 "$pkgdir/usr/share/gpupaper/shaders"
    install -Dm644 shaders/*.frag "$pkgdir/usr/share/gpupaper/shaders/"
}
