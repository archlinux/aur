# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-recurring-ical-events
pkgver=2.2.1
pkgrel=1
pkgdesc="Python library for recurrence of ical events based on icalendar"
arch=('any')
url="https://github.com/niccokunzmann/python-recurring-ical-events"
license=('LGPL-3.0-or-later')
depends=('python-dateutil' 'python-icalendar' 'python-pytz' 'python-x-wr-timezone')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f213ef0a60c39581c28f8b8157797bcdc1e09541146f7862b65df097bfce6a95')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
