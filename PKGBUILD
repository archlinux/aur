# Maintainer: 261519 <jonathan.j.rayner@gmail.com>
# Contributor: asermax <asermax@gmail.com>
pkgname=kaggle-api
_name=${pkgname%-api}
pkgver=1.5.16
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
sha256sums=('a6b3542f590cf341a5ad441d5ae021be93bd64441c96c758b154903495a3a600')
