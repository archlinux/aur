# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=bithuman
pkgname=python-$_name
_py=cp314
pkgver=2.11.19
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
sha256sums_x86_64=('82e0af58c882d0638fc216f3563c0718b3a8fed1a51748eb269675a36566426f')
sha256sums_aarch64=('ab8e495c64dc2a194258b089365e879fa20d23b1ec3b8ad8131abd743939c8ae')

package() {
  python -m installer --destdir="$pkgdir" *.whl
}
