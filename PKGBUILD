# Maintainer: Alexander Bocken <alexander@bocken.org>

_name=dscribe
pkgname=python-${_name,,}
pkgver=2.1.1
pkgrel=1
pkgdesc='Creating feature transformations in applications of ML to materials science'

arch=('any')
url="https://singroup.github.io/dscribe/"
license=('Apache-2.0')
depends=('python>3.7' 'pybind11>=2.4' python-numpy python-scipy 'python-ase>=3.19.0' python-scikit-learn 'python-joblib>=1.0.0' python-sparse)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
)
sha256sums=(444484b7070255257383d191936f8bb5e4b11c1ba8eb4ac22c7273e82f9c8bdd)

makedepends=(python-build python-installer python-wheel meson-python)

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
