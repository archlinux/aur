# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-partial-json-parser
_pkgname=partial_json_parser
pkgver=0.2.1.1.post6
pkgrel=2
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
sha256sums=('43896b68929678224cbbe4884a6a5fe9251ded4b30b8b7d7eb569e5feea93afc')

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
