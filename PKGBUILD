# Maintainer: Daniel M. Capella <polyzen@archlinux.info>
# Contributor: Sirat18 <aur@sirat18.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=python-icalendar
pkgver=3.11.5
pkgrel=1
pkgdesc='A parser/generator of iCalendar files (RFC 2445)'
arch=('any')
url=https://github.com/collective/icalendar
license=('GPL')
depends=('python-dateutil' 'python-pytz')
makedepends=('python-setuptools')
source=("icalendar-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('24631f0c229fedc1d65e5e359af0c35560e2b20c9bfb9ac593f397b393fefaee68e5d03aaa1a4d0055154209272454b58b6a61778af894f8d65248adc5130d95')

check() {
  cd icalendar-$pkgver
  python setup.py -q test
}

package() {
  cd icalendar-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
