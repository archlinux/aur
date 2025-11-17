# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-partial-json-parser
_pkgname=partial_json_parser
pkgver=0.2.1.1.post7
pkgrel=1
pkgdesc="customizable library for parsing partial JSON strings"
arch=('any')
url='https://github.com/promplate/partial-json-parser'
license=(MIT)
makedepends=(
  python-build
  python-installer
  python-wheel
  python-pdm-backend
)
source=("https://files.pythonhosted.org/packages/source/p/${_pkgname//_/-}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('86590e1ba6bcb6739a2dfc17d2323f028cb5884f4c6ce23db376999132c9a922')

build() {
  cd ${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

#check() {
  #cd ${_pkgname}-${pkgver}
  #python -m pytest -s -v tests # no tests
#}

package() {
  cd ${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
# vim:set ts=2 sw=2 et:
