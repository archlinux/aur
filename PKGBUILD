# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=quimb
pkgname=python-$_name
pkgver=1.7.2
pkgrel=1
pkgdesc='Quantum information and many-body library.'
arch=(any)
url='https://github.com/jcmgray/quimb'
license=(Apache)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-setuptools-scm python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('4bc1cbb95dec13bffd670703516bd8fad8d5de130f92394df4bb68802095c6356f807d2306b3a81d8f11a60fe83daf700d38b97228625778f9f7f26b010e126d')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
