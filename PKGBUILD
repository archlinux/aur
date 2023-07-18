# Maintainer: Tobias Brox <t-arch@tobixen.no>
pkgname=calendar-cli
_name=${pkgname#python-}
pkgver=1.0.1
pkgrel=1
pkgdesc="calendar-cli is a caldav client for calendar and task management"
url="https://github.com/tobixen/calendar-cli"
arch=('any')
license=('GPL')
depends=('python' 'python-caldav' 'python-icalendar' 'python-pytz' 'python-vobject' 'python-tzlocal' 'python-six')
makedepends=('python-build'
             'python-installer'
             'python-pytest'
             'python-setuptools'
             'python-wheel')
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


sha256sums=('92555b8fd853008a570dcbb9591e7416fd744703b5e02da8acac92e4cbe69f3e')
