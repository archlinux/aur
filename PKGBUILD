# Maintainer: Tobias Brox <t-arch@tobixen.no>
pkgname=plann
_name=${pkgname#python-}
pkgver=1.0.0
pkgrel=4
pkgdesc="plann is a caldav client for calendar and task management"
url="https://github.com/tobixen/plann"
arch=('any')
license=('GPL')
depends=('python' 'python-caldav' 'python-icalendar')
makedepends=('python-build'
             'python-installer'
             'python-pytest'
             'python-setuptools'
             'python-yaml'
             'python-click'
             'python-sortedcontainers'
             'python-wheel'
             'xandikos')
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

sha256sums=('8b275e15ec3e775de4efb766056ee8292e0f55dd43cbae4592d8de496a7bd8ff')

