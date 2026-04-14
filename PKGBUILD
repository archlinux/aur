# Maintainer: Jonatan Jonasson <notes@madeingotland.com>

pkgname=whisper.cpp-cuda-bin
_upstream_pkgname=whisper.cpp
pkgver=1.8.4
pkgrel=2
_libggml_pkgver=0.9.11
_libggml_pkgrel=2
pkgdesc="Port of OpenAI's Whisper model in C/C++ with NVIDIA CUDA optimizations"
arch=('x86_64')
url="https://github.com/OneNoted/whisper.cpp-cuda-bin"
license=('MIT')
depends=(
  "libggml-cuda-bin=${_libggml_pkgver}-${_libggml_pkgrel}"
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
sha256sums=('c9970a080ca277fad0a5929c726c3fb7f437746e7d5da11910cccdca641156d5')

package() {
  bsdtar -xf "${srcdir}/${_asset_name}" -C "${pkgdir}"
}
