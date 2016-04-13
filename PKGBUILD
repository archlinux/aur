# Maintainer: Sirat18 <aur@sirat18.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=python-icalendar-git
_gitname='icalendar'
_gitroot='https://github.com/collective/icalendar.git'
pkgver=3.9.2.r2.g608b211
pkgrel=1
pkgdesc='A parser/generator of iCalendar files (RFC 2445)'
arch=('any')
url='http://pypi.python.org/pypi/icalendar/'
license=('GPL')
depends=('python' 'python-pytz' 'python-dateutil')
provides=('python-icalendar')
replaces=('python-icalendar')
conflicts=('python-icalendar')
makedepends=('python-distribute' 'git')

source=("$_gitname"::"git+$_gitroot")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root=${pkgdir} --optimize=1
}

# vim:set ts=2 sw=2 et:
