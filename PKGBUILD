# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=rpa
pkgname=python-$_name
pkgver=1.50.0
pkgrel=1
pkgdesc='RPA for Python is a Python package for RPA (robotic process automation)'
arch=(x86_64)
url='https://github.com/tebelorg/RPA-Python'
license=('Apache')
depends=(opencv python python-tagui tesseract)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('bc8c3b6e70e423a411bacf46dba699e0baca48c29505e018789b25a10eb905458adc1209841adfefa59babd8bfe899fdefd31972a6cca90044bd8a4b5157e811')

build() {
    cd $_name-$pkgver
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}
