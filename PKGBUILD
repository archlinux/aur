# Maintainer: Mahdi Sarikhani <mahdisarihani@outlook.com>

pkgname=python-sphinx-rfcsection
_name=${pkgname#python-}
pkgver=0.1.1
pkgrel=1
pkgdesc="Intelligently title Sphinx references to RFC sections"
arch=('any')
license=('GPL-3.0-or-later')
url="https://github.com/dgw/sphinx-rfcsection"
depends=('python-sphinx')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('02dadc3145f8786d273f3509e24af67cd35789efae44b2a9089fb117d8e18982')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
