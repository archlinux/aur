# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-recurring-ical-events
pkgver=2.2.3
pkgrel=1
pkgdesc="Python library for recurrence of ical events based on icalendar"
arch=('any')
url="https://github.com/niccokunzmann/python-recurring-ical-events"
license=('LGPL-3.0-or-later')
depends=('python-dateutil' 'python-icalendar' 'python-pytz' 'python-x-wr-timezone')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6f4f3016d00e0b3e1f27ca6ba22184f6c13589a2bda9927b5f8094c100cd14b5')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
