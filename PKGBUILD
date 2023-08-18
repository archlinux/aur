# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=pystack
pkgname=python-$_name
pkgver=1.2.0
pkgrel=1
pkgdesc='Analysis of the stack of remote python processes'
arch=(any)
url='https://github.com/bloomberg/pystack'
license=('Apache')
depends=(python)
makedepends=(cython libelf python-build python-installer python-setuptools python-wheel)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('7148f3903b5112c17ebfc086e1fd3360020fed86c3d3a7c89d8b1219c5df1ef25556b73fc7619869743129d8b7594aaca9978baa6db5ab224d625990c527a16d')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
