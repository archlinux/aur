# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-recurring-ical-events
pkgver=2.1.2
pkgrel=1
pkgdesc="Python library for recurrence of ical events based on icalendar"
arch=('any')
url="https://github.com/niccokunzmann/python-recurring-ical-events"
license=('LGPL3')
depends=('python-dateutil' 'python-icalendar' 'python-pytz' 'python-x-wr-timezone')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f4a83f468edac0d0f100f91c74d685afcbb5642cb730418ad5c4062d4b86a008')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
