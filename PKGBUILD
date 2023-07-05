# Maintainer: Lex Black <autumn-wind@web.de>

_module=configula
pkgname=python-${_module}
pkgver=0.5.2
pkgrel=1
pkgdesc="creates config for papermerge-core"
arch=(any)
url="https://github.com/papermerge/configula"
license=(Apache)
depends=(python-tomlkit)
makedepends=(python-build python-installer python-wheel python-poetry-core)
source=(https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module//-/_}-$pkgver.tar.gz)
sha256sums=('d293087a584ff94c48b96b9bb0b1ae9cbc61ed1efdacd6bf66ffd750c91d900a')


build() {
  cd "${_module//-/_}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_module//-/_}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
