# Maintainer: Jonatan Jonasson <notes@madeingotland.com>

pkgname=whisper.cpp-cuda-bin
_upstream_pkgname=whisper.cpp
pkgver=1.9.2
pkgrel=2
_libggml_pkgver=0.19.0
_libggml_pkgrel=1
pkgdesc="Port of OpenAI's Whisper model in C/C++ with NVIDIA CUDA optimizations"
arch=('x86_64')
url="https://github.com/OneNoted/whisper.cpp-cuda-bin"
license=('MIT')
depends=(
  'libggml-cuda-bin'
  'cuda'
  'nvidia-utils'
  'sdl2-compat'
)
provides=(
  "whisper.cpp=${pkgver}"
  "whisper.cpp-cuda=${pkgver}"
)
conflicts=(
  'whisper.cpp'
  'whisper.cpp-cuda'
)

_asset_name="${pkgname}-${pkgver}-${pkgrel}-x86_64.tar.zst"
source=(
  "${_asset_name}::${url}/releases/download/v${pkgver}-${pkgrel}/${_asset_name}"
)
sha256sums=('5bbf5c1794b6544399f521de982d083754da61cf8175de14477caf510d19d38e')

package() {
  bsdtar -xf "${srcdir}/${_asset_name}" -C "${pkgdir}"
}
