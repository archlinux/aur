# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=bithuman
pkgname=python-$_name
_py=cp314
pkgver=2.11.18
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
source_x86_64=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/$_name-$pkgver-$_py-$_py-manylinux_2_28_x86_64.whl")
source_aarch64=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/$_name-$pkgver-$_py-$_py-manylinux_2_28_aarch64.whl")
noextract=("$_name-$pkgver-$_py-$_py-manylinux_2_28_x86_64.whl"
           "$_name-$pkgver-$_py-$_py-manylinux_2_28_aarch64.whl")
sha256sums_x86_64=('c8c951a1764652e9d05dc4a005028819219540d964387883cc3e72ec3bca3c73')
sha256sums_aarch64=('880b802a3da3f43d03f5de3cde0ef59edf3dc8c28d941d71877987bb967ee3a5')

package() {
  python -m installer --destdir="$pkgdir" *.whl
}
