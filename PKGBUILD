# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-recurring-ical-events
pkgver=3.3.0
pkgrel=1
pkgdesc="Python library for recurrence of ical events based on icalendar"
arch=('any')
url="https://github.com/niccokunzmann/python-recurring-ical-events"
license=('LGPL-3.0-or-later')
depends=(
  'python-dateutil'
  'python-icalendar'
  'python-tzdata'
  'python-x-wr-timezone'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
#checkdepends=(
#  'python-pygments'
#  'python-pytest'
#  'python-pytest-cov'
#  'python-pytz'
#  'python-restructuredtext_lint'
#)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b8d81da53fb400dc6343775967b462cffe2703bee6109d7c39ba3193ee66e793')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

#check() {
#  cd "$pkgname-$pkgver"
#  pytest
#}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
