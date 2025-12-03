# Maintainer: Alexander Bocken <alexander@bocken.org>

_name=dscribe
pkgname=python-${_name,,}
pkgver=2.1.2
pkgrel=1
pkgdesc='Creating feature transformations in applications of ML to materials science'

arch=('any')
url="https://singroup.github.io/dscribe/"
license=('Apache-2.0')
depends=('python>3.7' 'pybind11>=2.4' python-numpy python-scipy 'python-ase>=3.19.0' python-scikit-learn 'python-joblib>=1.0.0' python-sparse)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
)
sha256sums=(5cbc88f1be444c7590e315868a4e7ea88e11cee4311575f8e1d26bb834d43c97)

makedepends=(python-build python-installer python-wheel meson-python)

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
