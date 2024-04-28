# Maintainer: Alexander Bocken <alexander@bocken.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Federico Cassani <federico dot cassani at outlook dot com>

_name=tslearn
pkgname=python-${_name,,}
pkgver=0.6.3
pkgrel=3
pkgdesc='A machine learning toolkit dedicated to time-series data'
arch=('any')
url="https://github.com/tslearn-team/tslearn"
license=('BSD-2-Clause')
depends=('python' 'python-numpy' 'python-scipy' 'python-scikit-learn' 'python-numba' 'python-joblib' 'python-tensorflow')
makedepends=('python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c855c0b784b42dc4c50f4eaf524ec7ed658037e86fc14af38ca3b66c75dd6adb')
makedepends=(python-build python-installer python-wheel)

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
