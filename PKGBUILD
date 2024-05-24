# Mantainer: sgar < swhaat at github >
# Maintainer: Butui Hu <hot123tea123@gmail.com>
# Contributor: Mohammad Hossein Sekhavat <sekhavat17@gmail.com>

_pkgname=streamlit
pkgname=python-streamlit
pkgver=1.35.0
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
sha512sums=('859daba233dea1178ecff5612a43699170d27759f8f1a0e322a68c4fadbf7682048d3d99946e74835e2725a7ea00f41d1a194cf3fd452d6e37b732fcdcd89a0e')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  rm -vf "${pkgdir}/usr/bin/streamlit.cmd"
}
# vim:set ts=2 sw=2 et:
