# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=rpa
pkgname=python-$_name
pkgver=1.48.1
pkgrel=1
pkgdesc='ModernGL: High performance rendering for Python 3'
arch=(x86_64)
url='https://github.com/tebelorg/RPA-Python'
license=('Apache')
depends=(opencv python python-tagui tesseract)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('SKIP')

build() {
    cd $_name-$pkgver
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}
