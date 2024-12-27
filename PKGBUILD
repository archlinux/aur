# Maintainer: envolution
# Contributor: Danny Waser (Waser Technologies) <waser@waser.tech>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-coqpit
_pkgname=coqpit
pkgver=0.0.17
pkgrel=2
pkgdesc='Simple (maybe too simple), light-weight config management through python data-classes.'
arch=(any)
url=https://github.com/erogol/coqpit
license=(MIT)
depends=(python)
makedepends=(python-setuptools python-build python-installer python-pytest)
source=("https://files.pythonhosted.org/packages/source/c/coqpit/coqpit-${pkgver}.tar.gz")
md5sums=('eaee0592fe431142c8548ef868762274')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --no-isolation --wheel
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
# vim:set ts=2 sw=2 et:
