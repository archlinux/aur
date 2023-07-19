# Maintainer: Tobias Brox <t-arch@tobixen.no>
pkgname=plann
_name=${pkgname#python-}
pkgver=0.15
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


sha256sums=('9540d6aa4fe2b47e6bc1d32694d352b7c11a5c64ac16eb2a7728bbae7611d49c')
