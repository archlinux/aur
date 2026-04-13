# Maintainer: OneNoted <38808968+OneNoted@users.noreply.github.com>

pkgname=whisper.cpp-cuda-bin
_upstream_pkgname=whisper.cpp
pkgver=1.8.4
pkgrel=1
_libggml_pkgver=0.9.11
_libggml_pkgrel=1
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
sha256sums=('c24fee69fff38a8f59aad647e51be41ee98042eb148d2b90dd12c70a1c5f8d74')

package() {
  bsdtar -xf "${srcdir}/${_asset_name}" -C "${pkgdir}"
}

