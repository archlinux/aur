# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: xduugu

pkgname=python2-icalendar
_pkgname=icalendar
pkgver=3.10
pkgrel=1
pkgdesc='A parser/generator of iCalendar files (RFC 2445)'
arch=('any')
url='http://pypi.python.org/pypi/icalendar/'
license=('BSD')
depends=('python2' 'python2-pytz' 'python2-dateutil')
makedepends=('python2-distribute')
source=(https://pypi.python.org/packages/3f/40/a479fd8d450e06ab0965227b3231ac3c4479dbaf424fdbdd1045809dc434/${_pkgname}-${pkgver}.tar.gz)
md5sums=('81e869ea0b3293cc9e615a9d166ae1fd')
sha256sums=('472f01da00e1e28eaf0cf03cc872c4cbce22dab50629ea9e72470761c6b45505')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
