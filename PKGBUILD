# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=tagui
pkgname=python-$_name
pkgver=1.48.1
pkgrel=2
pkgdesc='RPA for Python is a Python package for RPA (robotic process automation) (tagui dependency)'
arch=(x86_64)
url='https://github.com/tebelorg/RPA-Python'
license=('Apache')
depends=(php python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('fdbdb2733c1d350506e3214b29b3244533465c1fa28de1740dfd994b17f58506ab4cfb2e71438c49c19f30db8207a550b1db4e18de029c1ce3558daf79d340e6')

build() {
    cd $_name-$pkgver
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}
