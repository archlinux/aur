# Maintainer: Bendik Aagaard Lynghaug <bendik.lynghaug@gmail.com>
pkgname=gpupaper
pkgver=0.1.3
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
sha256sums_x86_64=('38f543f2c71a8ef3a0496acf3dbd67361fe53a7fb5f011a6e0fd9199d8c44ec6')
sha256sums_aarch64=('477021e223b03fa59a2255fea80c1a7140d2c08d11edf544bc2822b839f7dd7d')

package() {
    install -Dm755 gpupaper "$pkgdir/usr/bin/gpupaper"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -dm755 "$pkgdir/usr/share/gpupaper/shaders"
    install -Dm644 shaders/*.frag "$pkgdir/usr/share/gpupaper/shaders/"
}
