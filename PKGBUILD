# Maintainer: Lex Black <autumn-wind@web.de>

_module=salinic
pkgname=python-${_module}
pkgver=0.6.1
pkgrel=1
pkgdesc="provides modular search and features a unified API that allows to plug in different search backends"
arch=(any)
url="https://github.com/papermerge/salinic"
license=(Apache)
depends=(python-pydantic python-requests python-xapian)
makedepends=(python-build python-installer python-wheel python-poetry-core)
source=(https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module//-/_}-$pkgver.tar.gz)
sha256sums=('b88181ce18fa1a434aa39d1b7d96387605e6610c4cda681a03e9bab2a77547e9')


build() {
  cd "${_module//-/_}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_module//-/_}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
