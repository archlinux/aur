# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=bithuman
pkgname=python-$_name
_py=cp314
pkgver=2.12.6
pkgrel=1
epoch=1
pkgdesc='bitHuman Python SDK — libessence-backed avatar runtime.'
arch=('x86_64' 'aarch64')
url='https://github.com/bithuman-product/bithuman-sdk-public/tree/main/python'
license=('custom')
depends=('python'
         'python-numpy'
         'python-loguru'
         'python-soundfile'
         'python-pydantic'
         'python-pydantic-settings'
         'python-av'
         'python-opencv'
         'zlib'
         'libstdc++'
         'glibc'
         'libgcc')
makedepends=('python-installer')
optdepends=('python-ai-edge-litert: expression-2'

            'python-onnxruntime: essence-2')
source_x86_64=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/$_name-$pkgver-$_py-$_py-manylinux_2_28_x86_64.whl")
source_aarch64=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/$_name-$pkgver-$_py-$_py-manylinux_2_28_aarch64.whl")
noextract=("$_name-$pkgver-$_py-$_py-manylinux_2_28_x86_64.whl"
           "$_name-$pkgver-$_py-$_py-manylinux_2_28_aarch64.whl")
sha256sums_x86_64=('a2d5c1e014f81e2adc4aa2b705f6ce2e0acc9516617db4be9218f41fe5c5765f')
sha256sums_aarch64=('1696eca1173f4695ce3b3498ed8c357a042af6416d63e81348ab8c6d31b9da64')

package() {
  python -m installer --destdir="$pkgdir" *.whl
}
