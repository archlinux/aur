# Maintainer: Daniel M. Capella <polyzen@archlinux.info>
# Contributor: Sirat18 <aur@sirat18.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=python-icalendar
pkgver=3.11.6
pkgrel=1
pkgdesc='A parser/generator of iCalendar files (RFC 2445)'
arch=('any')
url=https://github.com/collective/icalendar
license=('GPL')
depends=('python-dateutil' 'python-pytz')
makedepends=('python-setuptools')
source=("icalendar-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('d3785f4637d21c21e3a4ed425d7ed565c1287dfc23897bd5e6ab6b788a56eeddc9f426ae7fca23d6f6436371675e9f5a9183f6ee69194b0388098c68efbe92b1')

check() {
  cd icalendar-$pkgver
  python setup.py -q test
}

package() {
  cd icalendar-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
