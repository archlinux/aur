# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=bithuman
pkgname=python-$_name
_py=cp314
pkgver=2.9.0
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
sha256sums_x86_64=('50c34dc5760bcb12121583da1fcc56c69111b841e06d6fe3bf3bf3fedace40d3')
sha256sums_aarch64=('ebf74ce5abc8bc287cf54e0721c08072bbe688bc63f3f360fb159b17f387b601')

package() {
  python -m installer --destdir="$pkgdir" *.whl
}
