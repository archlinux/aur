# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: xduugu

pkgname=python2-icalendar
_pkgname=icalendar
pkgver=3.8.4
pkgrel=1
pkgdesc='A parser/generator of iCalendar files (RFC 2445)'
arch=('any')
url='http://pypi.python.org/pypi/icalendar/'
license=('BSD')
depends=('python2' 'python2-pytz' 'python2-dateutil')
makedepends=('python2-distribute' 'unzip')
source=(http://pypi.python.org/packages/source/i/icalendar/icalendar-${pkgver}.zip)
md5sums=('d700e6e75613fd1ee882c4b11c58940c')
sha256sums=('7034e184ef3f9010f074410cea11b68fa93ef847f3fb185be41d6bd261c9cbb8')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
