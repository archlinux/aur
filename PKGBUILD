# Maintainer: Jonatan Jonasson <notes@madeingotland.com>

pkgname=libggml-cuda-bin
_upstream_pkgname=ggml
pkgver=0.10.0
pkgrel=1
pkgdesc="Tensor library for machine learning with OpenBLAS, Vulkan, and CUDA"
arch=('x86_64')
url="https://github.com/OneNoted/libggml-cuda-bin"
license=('MIT')
depends=(
  'cuda'
  'nvidia-utils'
  'openblas'
  'vulkan-driver'
  'vulkan-icd-loader'
)
provides=(
  "libggml=${pkgver}"
  "libggml-cuda-git=${pkgver}"
)
conflicts=(
  'libggml'
  'libggml-cuda-git'
)

_asset_name="${pkgname}-${pkgver}-${pkgrel}-x86_64.tar.zst"
source=(
  "${_asset_name}::${url}/releases/download/v${pkgver}-${pkgrel}/${_asset_name}"
)
sha256sums=('9ed96fcbb843ef9d3079475b4faaf9f0844c97db345f440c5d15ed1295b3bdf9')

package() {
  bsdtar -xf "${srcdir}/${_asset_name}" -C "${pkgdir}"
}
