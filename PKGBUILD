# Maintainer: Bendik Aagaard Lynghaug <bendik.lynghaug@gmail.com>
pkgname=gpupaper
pkgver=0.1.5
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
sha256sums_x86_64=('306ca18380da9b844fe9281b93d618c35cb135953202ab13fbb95e94b3cde0f6')
sha256sums_aarch64=('f5b73ec933a347568e064da49276a58839216a5d0a87b13cb06e9686118c44c0')

package() {
    install -Dm755 gpupaper "$pkgdir/usr/bin/gpupaper"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -dm755 "$pkgdir/usr/share/gpupaper/shaders"
    install -Dm644 shaders/*.frag "$pkgdir/usr/share/gpupaper/shaders/"
}
