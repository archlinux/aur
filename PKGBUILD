pkgname=python-sklearn-morpho
_name=sklearn_morpho
pkgver=0.2.4
pkgrel=1
pkgdesc="Scikit-learn estimator toolbox for morphological perceptrons"
arch=("any")
url="https://github.com/d-002/sklearn-morpho"
license=("MIT")
depends=("python" "python-cvxpy" "python-numpy" "python-scikit-learn")
makedepends=("python-build" "python-installer" "python-wheel" "python-hatchling")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('863484716b257579e1128e5b4efb2d96dacfead4d58a8152bd4c4f872d7fb742')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
