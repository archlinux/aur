# Maintainer: gilcu3
_pkgname=ctranslate2
pkgname=python-$_pkgname-bin
pkgver=4.7.2
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
sha256sums_x86_64=('54392ef0f1353c8b339640ca1a342761258ea3c58e744e91562d225dc5f40ec4')
sha256sums_aarch64=('05127c6f04de072fba6e6e6e012f7c9265cd65cb1ad19420b861d23fb1e62e90')
