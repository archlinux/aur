# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=xandikos
pkgver=0.0.3
pkgrel=1
pkgdesc='CardDAV/CalDAV server that backs onto a Git repository'
arch=('any')
url=https://jelmer.uk/code/xandikos/
license=('LGPL')
depends=('python-defusedxml' 'python-dulwich' 'python-icalendar' 'python-jinja')
makedepends=('python-setuptools')
source=("xandikos-$pkgver.tar.gz::${url}tarball/v$pkgver")
sha512sums=('0af3c2bd511ab4014a231790fc6219c9f2589efe2af5cd6b1478f34bea96c813dcd9d622f0e9abc2e4545d7cbeac0e6a213672b5f9f371fe9f80d8ed59ed4509')

check() {
  make check
}

package() {
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
