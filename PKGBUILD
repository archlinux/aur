# Maintainer: gilcu3
_pkgname=ctranslate2
pkgname=python-$_pkgname-bin
pkgver=4.2.1
pkgrel=1
pkgdesc="CTranslate2 is a C++ and Python library for efficient inference with Transformer models."
arch=('x86_64')
url="https://github.com/OpenNMT/CTranslate2"
license=('MIT')
provides=("ctranslate2")
conflicts=('ctranslate2-git' 'python-ctranslate2-git')
depends=('gcc-libs' 'python-numpy' 'python-pytorch' 'python-setuptools' 'python-yaml')
_py=cp312
wheel_name=${_pkgname//-/_}-$pkgver-$_py-${_py}-manylinux_2_17_$arch.manylinux2014_$arch.whl
source=(https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/$_pkgname/$wheel_name)
sha256sums=('1681fb06fa5714e3d440b4a9fce8f1fb71cfadfcc912e0346eaea4385269b347')

package() {
    python -m installer --destdir="$pkgdir" $wheel_name
}
