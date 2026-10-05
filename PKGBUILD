# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=bithuman
pkgname=python-$_name
_py=cp314
pkgver=2.11.21
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
optdepends=('python-ai-edge-litert: expression-2')
source_x86_64=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/$_name-$pkgver-$_py-$_py-manylinux_2_28_x86_64.whl")
source_aarch64=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/$_name-$pkgver-$_py-$_py-manylinux_2_28_aarch64.whl")
noextract=("$_name-$pkgver-$_py-$_py-manylinux_2_28_x86_64.whl"
           "$_name-$pkgver-$_py-$_py-manylinux_2_28_aarch64.whl")
sha256sums_x86_64=('c58a30c722ca74bf68a7bd56e893f24af3cc56d3c83de4f4abf6c0b13cda2725')
sha256sums_aarch64=('54121e4d27684f7e60568030b38ac110cbc22083ccad7519359afbb1cfb697fc')

package() {
  python -m installer --destdir="$pkgdir" *.whl
}
