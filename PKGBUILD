# Maintainer: Will Handley <wh260@cam.ac.uk>

pkgname=python-airportsdata
_pkgname=airportsdata
pkgver=20260315
pkgrel=1
pkgdesc="Extensive database of location and timezone data for nearly every airport and landing strip in the world"
arch=(any)
url="https://github.com/mborsetti/airportsdata"
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('eb67de3b8167bfe810020095188ebba043ed16e934cc52ba3930e2cbd1c2dcb6')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
