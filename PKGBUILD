# Maintainer: Daniel M. Capella <polyzen@archlinux.info>
# Contributor: Sirat18 <aur@sirat18.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=python-icalendar
pkgver=3.11.4
pkgrel=1
pkgdesc='A parser/generator of iCalendar files (RFC 2445)'
arch=('any')
url=https://github.com/collective/icalendar
license=('GPL')
depends=('python-dateutil' 'python-pytz')
makedepends=('python-setuptools')
source=("icalendar-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('577d26694bdb6d9c41ee1538ab3c3e2cc4d5c8a9e1b48d7f727f0fb4fe5c04f7f2c87d0d8afef2928a769ef252f256f05d03e3b910fab8778f63b3558d929444')

check() {
  cd icalendar-$pkgver
  python setup.py test
}

package() {
  cd icalendar-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
