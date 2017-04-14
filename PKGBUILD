# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=xandikos-git
pkgver=0.0.3.r2.ge3928ee
pkgrel=1
pkgdesc='CardDAV/CalDAV server that backs onto a Git repository (Git version)'
arch=('any')
url=https://jelmer.uk/code/xandikos/
license=('LGPL')
depends=('python-defusedxml' 'python-dulwich' 'python-icalendar' 'python-jinja')
makedepends=('git' 'python-setuptools')
provides=('xandikos')
conflicts=('xandikos')
source=("git+$url")
sha512sums=('SKIP')

pkgver() {
  cd xandikos
  git describe --long | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd xandikos
  make check
}

build() {
  cd xandikos
  python setup.py build
}

package() {
  cd xandikos
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
