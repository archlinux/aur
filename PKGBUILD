# Maintainer: Crandel
# Binary repackaging of ROCm/hrx-system release v0.3.0 (Linux x86_64 assets).
pkgbase=hrx-loom
pkgname=hrx-loom
pkgver=0.3.0
pkgrel=1
arch=(x86_64)
url='https://github.com/ROCm/hrx-system'
license=('Apache-2.0 WITH LLVM-exception')
options=(!strip !debug)
_rel="$url/releases/download/v$pkgver"
_whl="hrx_loom-$pkgver-py3-none-manylinux_2_39_x86_64.whl"
source=("$_rel/$_whl")
makedepends=(python-installer)
noextract=("$_whl")
sha256sums=('6252bb0df262351175bdb2c4aaca22ffa63d80d791659aa4d2fa5c92a0af426f')

package() {
  depends=(python gcc-libs glibc)
  optdepends=('python-huggingface-hub: loom-fetch from Hugging Face'
              'vulkan-icd-loader: Vulkan execution')
  python -m installer --destdir="$pkgdir" "$_whl"
}
