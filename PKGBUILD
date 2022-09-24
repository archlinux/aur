# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=rpa
pkgname=python-$_name
pkgver=1.48.1
pkgrel=2
pkgdesc='RPA for Python is a Python package for RPA (robotic process automation)'
arch=(x86_64)
url='https://github.com/tebelorg/RPA-Python'
license=('Apache')
depends=(opencv python python-tagui tesseract)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('2eabea0b0ce3560805a7b4a63a364cdc213d2d9a92ae4ec047b86f9816ba560d6b2e3fecc4484c98238524adef1ee4e4a199e679521ba86cb371f64004a600af')

build() {
    cd $_name-$pkgver
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}
