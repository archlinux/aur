# Maintainer: gilcu3
_pkgname=ctranslate2
pkgname=python-$_pkgname-bin
pkgver=4.6.0
pkgrel=2
pkgdesc="CTranslate2 is a C++ and Python library for efficient inference with Transformer models."
arch=('x86_64')
url="https://github.com/OpenNMT/CTranslate2"
license=('MIT')
provides=("ctranslate2" "python-ctranslate2")
conflicts=('ctranslate2-git' 'python-ctranslate2-git' 'python-ctranslate2')
depends=('gcc-libs' 'python-numpy' 'python-pytorch' 'python-setuptools' 'python-yaml')
makedepends=('python-installer')
_py=cp313
_wheel_name=${_pkgname//-/_}-$pkgver-$_py-${_py}-manylinux_2_17_$arch.manylinux2014_$arch.whl
source=(https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/$_pkgname/$_wheel_name)
sha256sums=('039aa6cc3ed662931a60dec0be28abeaaceb3cc6f476060b8017a7a39a54a9f6')

package() {
    python -m installer --destdir="$pkgdir" $_wheel_name
}
