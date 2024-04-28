# Maintainer: Alexander Bocken <alexander@bocken.org>

_name=dscribe
pkgname=python-${_name,,}
pkgver=2.1.0
pkgrel=2
pkgdesc='Creating feature transformations in applications of ML to materials science'

arch=('any')
url="https://singroup.github.io/dscribe/"
license=('Apache-2.0')
depends=('python>3.7' 'pybind11>=2.4' python-numpy python-scipy 'python-ase>=3.19.0' python-scikit-learn 'python-joblib>=1.0.0' python-sparse)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
)
sha256sums=('cbeb6c519dc7bf8203d42c8bd9388d42d848389284cbbf84a390f50a79c7b89f')

makedepends=(python-build python-installer python-wheel meson-python)

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
