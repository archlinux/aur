# Maintainer: Tobias Brox <t-arch@tobixen.no>
pkgname=plann
_name=${pkgname#python-}
pkgver=0.15.1
pkgrel=1
pkgdesc="plann is a caldav client for calendar and task management"
url="https://github.com/tobixen/plann"
arch=('any')
license=('GPL')
depends=('python' 'python-caldav' 'python-icalendar')
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


sha256sums=('a8feb0a5254da21d2882581de264b2f41739eaaf655329a272d0ac5d18933a98')
