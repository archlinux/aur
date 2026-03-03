# Maintainer: SteamedFish <steamedfish@hotmail.com>
pkgname=python-skops
pkgver=0.13.0
pkgrel=1
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
)
source=("https://files.pythonhosted.org/packages/b5/0c/5ec987633e077dd0076178ea6ade2d6e57780b34afea0b497fb507d7a1ed/skops-${pkgver}.tar.gz")
sha256sums=('66949fd3c95cbb5c80270fbe40293c0fe1e46cb4a921860e42584dd9c20ebeb1')

build() {
  cd "skops-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "skops-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
