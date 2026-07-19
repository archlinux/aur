# Maintainer: Pakrohk <pakrohk@gmail.com>
pkgname=python-evoid
pkgver=0.4.1
pkgrel=1
pkgdesc="EVOID — Reference Runtime for Intent-Oriented Programming"
arch=('any')
url="https://github.com/EvolveBeyond/EVOID"
license=('Apache-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/e/evoid/evoid-$pkgver.tar.gz")
sha256sums=('103bce9c7803792c393bbdf161c41165d7a0880858e57a641bf218591f662f2f')

build() {
    cd "evoid-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "evoid-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
