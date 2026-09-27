# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=bithuman
pkgname=python-$_name
_py=cp314
pkgver=2.11.14
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
sha256sums_x86_64=('c259c7a5e6d83e4eed5f2542f1fa9dc707b3ffd4adbfbca4a2b55ffa2f84515c')
sha256sums_aarch64=('c5c99279d30c272c6842fde69daa64eec33b84d2dc3360bc0433daae90ed3f26')

package() {
  python -m installer --destdir="$pkgdir" *.whl
}
