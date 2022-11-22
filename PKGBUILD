# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-recurring-ical-events
_name=recurring_ical_events
pkgver=1.1.0b0
pkgrel=1
pkgdesc="Python library for recurrence of ical events based on icalendar"
arch=('any')
url="https://github.com/niccokunzmann/python-recurring-ical-events"
license=('LGPL3')
depends=('python-dateutil' 'python-icalendar' 'python-pytz' 'python-x-wr-timezone')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
#checkdepends=('python-backports.zoneinfo' 'python-pytest-cov' 'python-pygments'
#              'python-restructuredtext-lint' 'python-tzdata')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9091671454a9df62356c9d0e9ef66365e255c6cc04044f665d083dd08a6c5c88')

prepare() {
  cd "$_name-$pkgver"
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

#check() {
#  cd "$_name-$pkgver"
#  pytest
#}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
