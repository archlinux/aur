# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: xduugu

pkgname=python2-icalendar
_pkgname=icalendar
pkgver=3.9.2
pkgrel=1
pkgdesc='A parser/generator of iCalendar files (RFC 2445)'
arch=('any')
url='http://pypi.python.org/pypi/icalendar/'
license=('BSD')
depends=('python2' 'python2-pytz' 'python2-dateutil')
makedepends=('python2-distribute')
source=(https://pypi.python.org/packages/source/i/icalendar/icalendar-${pkgver}.tar.gz)
md5sums=('92799281bedbce961102031a952448c0')
sha256sums=('0b2d2610e039404e22a0a72fe5a59614374e7bd15ed824ead6ef6f8d36b41e2f')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
