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
source=(${pkgname}-${pkgver}.tar.gz::"https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('c35ad3ef1dcb94c89c2b27e73872da0c6ddc9c55653103b3a6bede0f2e7afb75d54a0ee665d69d9f1e4afc689371e4dc01b7ebc1630fc17d7bf02929994c1973')

build() {
  cd "${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
