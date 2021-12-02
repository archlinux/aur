# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sandy Carter (bwrsandman) <bwrsandman@gmail.com>

pkgname=python-pythondialog
pkgver=3.5.2
pkgrel=2
pkgdesc="Python package for interfacing with dialog"
url="http://pythondialog.sf.net"
arch=('any')
license=('LGPL')
depends=('python' 'dialog')
makedepends=('python-setuptools')
source=("https://downloads.sourceforge.net/project/pythondialog/pythondialog/$pkgver/python3-pythondialog-$pkgver.tar.bz2"{,.asc})
sha512sums=('cdb26f5b14a51bc9f2968d1850bddaeb26ad22a5bde464d29974f57239bc006690f3770acd63a93bf06d78225b2d0a013ac4d6af3d1c0fa3520879e63de4e5b0'
            'SKIP')
validpgpkeys=('125B5A0FDB788FDD0EF41A9DC785B90B5053A3A2') # Florent Rougon <f.rougon@free.fr>

build() {
  cd pythondialog-$pkgver
  python setup.py build
}

package() {
  cd pythondialog-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
