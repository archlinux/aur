# Maintainer: Tobias Brox <t-arch@tobixen.no>
pkgname=calendar-cli
_name=${pkgname#python-}
pkgver=0.14.1
pkgrel=1
pkgdesc="calendar-cli is a caldav client for calendar and task management"
url="https://github.com/tobixen/calendar-cli"
arch=('any')
license=('GPL')
depends=('python' 'python-caldav>=0.11.0' 'python-icalendar' 'python-pytz' 'python-vobject' 'python-tzlocal' 'python-six')
source=("https://github.com/tobixen/$pkgname/archive/v$pkgver.tar.gz")


build() {
  cd "${_name}-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_name}-$pkgver"
  pytest
}

package() {
  cd "${_name}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}


sha256sums=('d4630c2b8947b576b1d5cc0b466ef1d88e1cc79239fc097cebd598e0544c48c2')
