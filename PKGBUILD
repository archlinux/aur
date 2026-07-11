# Maintainer: gilcu3
_pkgname=ctranslate2
pkgname=python-$_pkgname-bin
pkgver=4.8.1
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
sha256sums_x86_64=('e3e3aef4670a6c8dcea367401675f82b49b02c18f5837221bcd7cca90b1707a8')
sha256sums_aarch64=('c90eb0bd67b6bb183712cc3fd14bf01ec4f622cd625c5b33cc6c56be7d1c9c34')
