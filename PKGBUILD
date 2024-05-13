# Maintainer: 261519 <jonathan.j.rayner@gmail.com>
# Contributor: asermax <asermax@gmail.com>
pkgname=kaggle-api
_name=${pkgname%-api}
pkgver=1.6.3
pkgrel=1
pkgdesc='Kaggle API CLI'
arch=('any')
url="https://github.com/Kaggle/kaggle-api"
license=('Apache')
depends=(
  'python'
  'python-urllib3'
  'python-six'
  'python-certifi'
  'python-dateutil'
  'python-requests'
  'python-tqdm'
  'python-slugify'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
replaces=('kaggle-api')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
sha256sums=('27614ecd72613b9f586b872313af1638ad8c0a17d0c78ad9d4a71879becd72e4')
