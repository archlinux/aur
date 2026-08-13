# Maintainer: Jeremy MountainJohnson <jay@jskier.com>

_name=streamlit-calendar
pkgname=python-$_name
pkgver=1.4.0
pkgrel=1
pkgdesc='FullCalendar component for Streamlit apps'
arch=(any)
url='https://github.com/im-perativa/streamlit-calendar'
license=(Apache-2.0)
depends=(
  python
  python-streamlit
)
makedepends=(
  python-build
  python-installer
  python-poetry-core
  python-wheel
)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz)
sha256sums=('47bd4fe839fdcbc7f334cb3aec0b83556558357562bb58c5a9fdfe11cd4e7b80')

build() {
  cd ${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
