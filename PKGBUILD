# Maintainer: SteamedFish <steamedfish@hotmail.com>
pkgname=python-skops
pkgver=0.14.0
pkgrel=2
pkgdesc="Tools for sharing scikit-learn based models and putting them in production"
arch=('any')
url="https://github.com/skops-dev/skops"
license=('MIT')
depends=(
  'python'
  'python-numpy'
  'python-packaging'
  'python-prettytable'
  'python-scikit-learn'
  'python-scipy'
  'python-typing_extensions'
  'python-joblib'
  'python-matplotlib'
  'python-pandas'
  'python-pytest'
  'python-yaml'
)
optdepends=(
  'python-rich: for rich terminal output'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
  'python-hatchling'
)
source=("https://files.pythonhosted.org/packages/c8/9f/46448c4e41a4c5ee4bdb74b3758af48e5ff0faeffe40f4e301bfc7594894/skops-${pkgver}.tar.gz")
sha256sums=('6c8c0e047f691a3a582c3258943eecafcbfd79c8c7eef66260f3703e363254f0')

build() {
  cd "skops-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "skops-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
