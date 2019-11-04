# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sandy Carter (bwrsandman) <bwrsandman@gmail.com>

pkgname=python-pythondialog
pkgver=3.4.0
pkgrel=5
pkgdesc="Python package for interfacing with dialog"
url="http://pythondialog.sf.net"
arch=('any')
license=('LGPL')
depends=('python' 'dialog')
source=("https://downloads.sourceforge.net/project/pythondialog/pythondialog/$pkgver/python3-pythondialog-$pkgver.tar.bz2"{,.asc})
sha256sums=('019cdbffe3f61d32d6fb158ce48a767478af2aac2f31fb40460b39aefae604fe'
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
