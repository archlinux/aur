# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=symbex
pkgname=python-$_name
pkgver=1.4
pkgrel=1
pkgdesc='Find the Python code for specified symbols'
arch=(any)
url='https://github.com/simonw/symbex'
license=('Apache')
depends=('python>=3.8')
makedepends=(python-build python-click python-installer python-setuptools python-wheel)
source=("$url/archive/$pkgver.tar.gz")
b2sums=('5a6cbd4db4b746fa659ed4099bf6225b16d972309f3f5d7d3cabb0f0a218637d6e526f3c937c316a41ae0fbb048bf4905b8b8050469be8bc26ac8888811750d3')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
