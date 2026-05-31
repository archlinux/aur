pkgname=python-sklearn-morpho
_name=sklearn_morpho
pkgver=0.2.1
pkgrel=1
pkgdesc="Scikit-learn estimator toolbox for morphological perceptrons"
arch=("any")
url="https://github.com/d-002/sklearn-morpho"
license=("MIT")
depends=("python" "python-cvxpy" "python-pytest" "python-scikit-learn")
makedepends=("python-build" "python-installer" "python-wheel" "python-hatchling")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('aaf94e85e2f546928ace464bf776c08681cd5349a48012076c3c66a9e801961f')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
