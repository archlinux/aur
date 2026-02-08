# Maintainer: gilcu3
_pkgname=ctranslate2
pkgname=python-$_pkgname-bin
pkgver=4.7.1
pkgrel=1
pkgdesc="CTranslate2 is a C++ and Python library for efficient inference with Transformer models."
arch=('x86_64' 'aarch64')
url="https://github.com/OpenNMT/CTranslate2"
license=('MIT')
provides=("ctranslate2" "python-ctranslate2")
conflicts=('ctranslate2-git' 'python-ctranslate2-git' 'python-ctranslate2')
depends=('gcc-libs' 'python-numpy' 'python-pytorch' 'python-setuptools' 'python-yaml')
makedepends=('python-installer')
_py=cp314
_wheel_name_x86_64=${_pkgname//-/_}-$pkgver-$_py-${_py}-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl
source_x86_64=(https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/$_pkgname/$_wheel_name_x86_64)
_wheel_name_aarch64=${_pkgname//-/_}-$pkgver-$_py-${_py}-manylinux_2_27_aarch64.manylinux_2_28_aarch64.whl
source_aarch64=(https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/$_pkgname/$_wheel_name_aarch64)

_wheel_name=${_pkgname//-/_}-$pkgver-$_py-${_py}-manylinux_2_27_${arch}.manylinux_2_28_${arch}.whl

package() {
    python -m installer --destdir="$pkgdir" ${_wheel_name}
}
sha256sums_x86_64=('24c0482c51726430fb83724451921c0e539d769c8618dcfd46b1645e7f75960d')
sha256sums_aarch64=('1aa6796edcc3c8d163c9e39c429d50076d266d68980fed9d1b2443f617c67e9e')
