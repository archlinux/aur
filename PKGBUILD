# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=bithuman
pkgname=python-$_name
_py=cp314
pkgver=3.0.4
pkgrel=1
pkgdesc='bitHuman Python SDK — libessence-backed avatar runtime.'
arch=('x86_64' 'aarch64')
url='https://github.com/bithuman-product/bithuman-sdk-public/tree/main/python'
license=('custom')
depends=('python' 'python-numpy' 'python-loguru' 'python-soundfile' 'python-pydantic' 'python-pydantic-settings' 'python-av' 'python-opencv' 'zlib' 'libstdc++' 'glibc' 'libgcc')
makedepends=('python-installer')
source_x86_64=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/$_name-$pkgver-$_py-$_py-manylinux_2_28_x86_64.whl")
source_aarch64=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/$_name-$pkgver-$_py-$_py-manylinux_2_28_aarch64.whl")
noextract=("$_name-$pkgver-$_py-$_py-manylinux_2_28_x86_64.whl"
           "$_name-$pkgver-$_py-$_py-manylinux_2_28_aarch64.whl")
sha256sums_x86_64=('3e41e312c52d0c518638d540fe57cd1f21557db6bb4679aba0e1d4fdb900ecd0')
sha256sums_aarch64=('231badd8929a8c92b5b6e47df41616a952ed95540f56fd68904d32f792a606b7')

package() {
  python -m installer --destdir="$pkgdir" *.whl
}
