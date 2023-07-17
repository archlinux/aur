# Mantainer: sgar < swhaat at github >
# Maintainer: Butui Hu <hot123tea123@gmail.com>
# Contributor: Mohammad Hossein Sekhavat <sekhavat17@gmail.com>

_pkgname=streamlit
pkgname=python-streamlit
pkgver=1.24.1
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
sha512sums=('2dcfc26c9b5fe5039ae29738b3a2379fb19108491961b3a934c3b057b0210af8bc8b7bbb7e616246b84bf9e3ddd9e44a602c413a512421ceea3a2d35ffcb8c11')

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
