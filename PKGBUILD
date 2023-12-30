# Maintainer: Lex Black <autumn-wind@web.de>

_module=salinic
pkgname=python-${_module}
pkgver=0.3.9
pkgrel=1
pkgdesc="provides modular search and features a unified API that allows to plug in different search backends"
arch=(any)
url="https://github.com/papermerge/salinic"
license=(Apache)
depends=(python-pydantic python-requests python-xapian)
makedepends=(python-build python-installer python-wheel python-poetry-core)
source=(https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module//-/_}-$pkgver.tar.gz)
sha256sums=('4139b38d0131ad8e014b0f86fb281eb7e702166f65b0c8e92c9e5c2b5a706204')


build() {
  cd "${_module//-/_}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_module//-/_}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
