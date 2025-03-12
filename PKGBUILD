# Maintainer: redponike <proton (dot) me>
# Contributor: sgar < swhaat at github >
# Contributor: Butui Hu <hot123tea123@gmail.com>
# Contributor: Mohammad Hossein Sekhavat <sekhavat17@gmail.com>

_pkgname=streamlit
pkgname=python-streamlit
pkgver=1.43.2
pkgrel=1
pkgdesc='A faster way to build and share data apps'
arch=('any')
url='https://streamlit.io'
license=('Apache-2.0')
depends=(
  python-altair
  python-blinker
  python-cachetools
  python-click
  python-numpy
  python-packaging
  python-pandas
  python-pillow
  python-protobuf
  python-pyarrow
  python-requests
  python-tenacity
  python-toml
  python-typing_extensions
  python-watchdog
)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('19e37d886096eac90b77d3cd65e5a1f65167e38858caf7b652142759679bd53744be2b107fa67112c3be879e16df36ca44d7e10d262505337e92bfcdc854ad80')


build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  rm -vf "${pkgdir}/usr/bin/streamlit.cmd"
}
