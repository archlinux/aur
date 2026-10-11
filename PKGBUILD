# Maintainer: RiverOnVenus <aur@zhui.dev>

pkgname=qwenimage-ncnn-vulkan-bin
pkgver=20261010
pkgrel=1
pkgdesc='Text-to-image generation and image editing with Qwen-Image and ncnn Vulkan'
arch=('x86_64')
url='https://github.com/nihui/qwenimage-ncnn-vulkan'
license=('Apache-2.0')
depends=(
  'gcc-libs'
  'glibc'
  'vulkan-icd-loader'
)
optdepends=(
  'vulkan-intel: Intel GPU support'
  'vulkan-nouveau: NVIDIA (NVK) GPU support'
  'vulkan-radeon: AMD GPU support'
  'nvidia-utils: NVIDIA proprietary driver GPU support'
)
provides=('qwenimage-ncnn-vulkan')
conflicts=('qwenimage-ncnn-vulkan' 'qwenimage-ncnn-vulkan-git')
options=('!strip')

source=("qwenimage-ncnn-vulkan-${pkgver}-linux.zip::${url}/releases/download/${pkgver}/qwenimage-ncnn-vulkan-${pkgver}-linux.zip"
        "qwenimage-ncnn-vulkan-${pkgver}.LICENSE::https://raw.githubusercontent.com/nihui/qwenimage-ncnn-vulkan/${pkgver}/LICENSE")
sha256sums=('8bcc171133e4fa28cec621e56ccca20e2b2f4a92739b537bf39f2e2abd551e5b'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')

package() {
  install -Dm755 "${srcdir}/qwenimage-ncnn-vulkan-${pkgver}-linux/qwenimage-ncnn-vulkan" \
    "${pkgdir}/usr/bin/qwenimage-ncnn-vulkan"

  install -Dm644 "${srcdir}/qwenimage-ncnn-vulkan-${pkgver}-linux/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/qwenimage-ncnn-vulkan-${pkgver}.LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
