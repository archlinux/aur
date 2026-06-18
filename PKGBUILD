pkgname=python-sklearn-morpho
_name=sklearn_morpho
pkgver=0.2.2
pkgrel=1
pkgdesc="Scikit-learn estimator toolbox for morphological perceptrons"
arch=("any")
url="https://github.com/d-002/sklearn-morpho"
license=("MIT")
depends=("python" "python-cvxpy" "python-pytest" "python-scikit-learn")
makedepends=("python-build" "python-installer" "python-wheel" "python-hatchling")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('4dc5a155a32332c4da33f375c7e4e83af15fa2a0ea8bb68f1843e74d0b47bce9')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
