# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: xduugu

pkgname=python2-icalendar
_pkgname=icalendar
pkgver=3.9.1
pkgrel=1
pkgdesc='A parser/generator of iCalendar files (RFC 2445)'
arch=('any')
url='http://pypi.python.org/pypi/icalendar/'
license=('BSD')
depends=('python2' 'python2-pytz' 'python2-dateutil')
makedepends=('python2-distribute')
source=(https://pypi.python.org/packages/source/i/icalendar/icalendar-${pkgver}.tar.gz)
md5sums=('e16251e71dd417b6ede1207fbea67f4c')
sha256sums=('d8e05184f943713cbd56e7f1bb122b9befa3fd1e175eaef72abecb21db67193a')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
