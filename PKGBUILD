# Maintainer: gilcu3
_pkgname=ctranslate2
pkgname=python-$_pkgname-bin
pkgver=4.6.2
pkgrel=2
pkgdesc="CTranslate2 is a C++ and Python library for efficient inference with Transformer models."
arch=('x86_64' 'aarch64')
url="https://github.com/OpenNMT/CTranslate2"
license=('MIT')
provides=("ctranslate2" "python-ctranslate2")
conflicts=('ctranslate2-git' 'python-ctranslate2-git' 'python-ctranslate2')
depends=('gcc-libs' 'python-numpy' 'python-pytorch' 'python-setuptools' 'python-yaml')
makedepends=('python-installer')
_py=cp313
_wheel_name_x86_64=${_pkgname//-/_}-$pkgver-$_py-${_py}-manylinux2014_x86_64.manylinux_2_17_x86_64.whl
source_x86_64=(https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/$_pkgname/$_wheel_name_x86_64)
_wheel_name_aarch64=${_pkgname//-/_}-$pkgver-$_py-${_py}-manylinux2014_aarch64.manylinux_2_17_aarch64.whl
source_aarch64=(https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/$_pkgname/$_wheel_name_aarch64)
sha256sums_x86_64=('ac1207e1aef08bf3679f33848b96f23a4d3ea078296cee473cce6a148cd8e145')
sha256sums_aarch64=('3fb491fe14bce7fade2ad0ec43a95ab4f3542c12c0d46b3b10638e977230d4a7')
_wheel_name=${_pkgname//-/_}-$pkgver-$_py-${_py}-manylinux2014_$arch.manylinux_2_17_$arch.whl
package() {
    python -m installer --destdir="$pkgdir" ${_wheel_name}
}
