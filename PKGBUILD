# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=tagui
pkgname=python-$_name
pkgver=1.50.0
pkgrel=1
pkgdesc='RPA for Python is a Python package for RPA (robotic process automation) (tagui dependency)'
arch=(x86_64)
url='https://github.com/tebelorg/RPA-Python'
license=('Apache')
depends=(php python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('7cfb48dbf10816d91c1be3ca7a9138d83dbf207222d6f148e0f2741a71357274632eedce2a1874513f5db455b43ce07b529da8776b41ca24327efb964af88f19')

build() {
    cd $_name-$pkgver
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}
