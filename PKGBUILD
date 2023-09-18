# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=types-retry
pkgname=python-$_name
pkgver=0.9.9.4
pkgrel=1
pkgdesc='Typing stubs for retry'
arch=(any)
url='https://github.com/python/typeshed'
license=('Apache')
depends=(python)
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('60aca69984a3dce0de4b5c543de6eff523d86b3931c51952ed680bfb2792169f9da4e90c06307646fffec8e71846654bb243cb0e290af977fb89ba988a99e2b5')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
