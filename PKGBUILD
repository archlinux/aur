# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=rpa
pkgname=python-$_name
pkgver=1.49.0
pkgrel=1
pkgdesc='RPA for Python is a Python package for RPA (robotic process automation)'
arch=(x86_64)
url='https://github.com/tebelorg/RPA-Python'
license=('Apache')
depends=(opencv python python-tagui tesseract)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('3c30c447bac4c5617a0007e68673ac3eb7de697d74b9ae16c21e43909e6446ef0b8946eccfcb3bc3a4ef9503c905b5b0cf018031543fcde248996ac4d3e2270d')

build() {
    cd $_name-$pkgver
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}
