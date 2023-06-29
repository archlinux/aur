# Mantainer: sgar < swhaat at github >
# Maintainer: Butui Hu <hot123tea123@gmail.com>
# Contributor: Mohammad Hossein Sekhavat <sekhavat17@gmail.com>

_pkgname=streamlit
pkgname=python-streamlit
pkgver=1.24.0
pkgrel=1
pkgdesc='The fastest way to build data apps in Python'
arch=('any')
url='https://streamlit.io'
license=('Apache')
depends=(
  python-altair
  python-astor
  python-attrs
  python-blinker
  python-cachetools
  python-click
  python-dateutil
  python-gitpython
  python-importlib-metadata
  python-numpy
  python-packaging
  python-pandas
  python-pillow
  python-protobuf
  python-pyarrow
  python-pydeck
  python-pympler
  python-requests
  python-toml
  python-tornado
  python-tzlocal
  python-validators
  python-watchdog
  semver
)
makedepends=(
  python-pipenv
  python-setuptools
)

source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
)
sha512sums=('782382b7ea67144f5d73856fb0c51921d6001c6013b6fcb1e3c1a0e97b71ca47ea9250399ebb1a91e37ae961477ebe75e77619b5b51a61014afbd1c22d50da47')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=0 --skip-build
  rm -vf "${pkgdir}/usr/bin/streamlit.cmd"
}
# vim:set ts=2 sw=2 et:
