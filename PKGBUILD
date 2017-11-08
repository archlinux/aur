# Maintainer: Daniel M. Capella <polyzen@archlinux.info>
# Contributor: Sirat18 <aur@sirat18.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=python-icalendar
pkgver=3.12
pkgrel=1
pkgdesc='A parser/generator of iCalendar files (RFC 2445)'
arch=('any')
url=https://github.com/collective/icalendar
license=('GPL')
depends=('python-dateutil' 'python-pytz')
makedepends=('python-setuptools')
source=("icalendar-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('c2d9ae207fc79b85cf20f0c7b3609ed6417d422f3c51028627fc8146909f9ca345fdca7ef87ba5181561494cc0e2a3a896876e2f1e62533b198ca5598e6e2207')

build() {
  cd icalendar-$pkgver
  python setup.py build
}

check() {
  cd icalendar-$pkgver
  python -m unittest discover src
}

package() {
  cd icalendar-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
