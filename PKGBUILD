pkgname=python-sklearn-morpho
_name=sklearn_morpho
pkgver=0.1.1
pkgrel=1
pkgdesc="Scikit-learn estimator toolbox for morphological perceptrons"
arch=("any")
url="https://github.com/d-002/sklearn-morpho"
license=("MIT")
depends=("python" "python-cvxpy" "python-pytest" "python-scikit-learn")
makedepends=("python-build" "python-installer" "python-wheel" "python-hatchling")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('0bba96bdf9e0d0c982276da7b7503c1812c337071bca4e813b2eb6eb0ab8e6bd')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
