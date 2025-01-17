# Maintainer: envolution
# Contributor: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

_pkgname=srsly
pkgname=python-${_pkgname}-bin
pkgver=2.5.1
pkgrel=1
pkgdesc='Modern high-performance serialization utilities for Python - bin (no cython0 req)'
arch=(x86_64)
url='https://github.com/explosion/srsly'
license=(MIT)
provides=(python-${_pkgname})
conflicts=(python-${_pkgname})
depends=(
  python-catalogue
  python-pytz
  python-mock
  python-numpy
  python-configobj
)
checkdepends=(
  python-pytest
  python-scipy
  python-psutil
  python-pytest-timeout
)
makedepends=(
  python-installer
  python-wheel
)
source=("https://github.com/explosion/srsly/releases/download/release-v${pkgver}/srsly-${pkgver}-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
b2sums=('b65ddaee0c99075a4e4c0eddac015b7bc228f873bc133851c8c73ad24c9d553def2c225cc58f4fd34a1a220c7a29b493d07ad52ec5e5c6117dc5802303a72e12')
noextract=("srsly-${pkgver}-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")

package() {
  python -m installer --destdir="$pkgdir" "srsly-${pkgver}-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
}
# vim:set ts=2 sw=2 et:
