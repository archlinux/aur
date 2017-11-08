# Maintainer: Daniel M. Capella <polyzen@archlinux.info>
# Contributor: Sirat18 <aur@sirat18.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=python-icalendar
pkgver=4.0.0
pkgrel=1
pkgdesc='A parser/generator of iCalendar files (RFC 2445)'
arch=('any')
url=https://github.com/collective/icalendar
license=('GPL')
depends=('python-dateutil' 'python-pytz')
makedepends=('python-setuptools')
source=("icalendar-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('d3e5a65e1a18ec6cd0861757b8810b1d23821623f3378b409a5e621ec0975b47d935a84ea03f8bbd4cc305663c97fd59ab050093aec9d485eacafb705b15a6c4')

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
