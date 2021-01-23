# Maintainer: 261519 <jonathan.j.rayner@gmail.com>
# Contributor: asermax <asermax@gmail.com>
pkgname=kaggle-api
_name=kaggle
pkgver=1.5.10
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
makedepends=(
  'python-setuptools'
)
source=("git+$url")
sha512sums=('SKIP')

build() {
  cd "$srcdir"/$pkgname
  python setup.py build
}

package() {
  cd "$srcdir"/$pkgname
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
