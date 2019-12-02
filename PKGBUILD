# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sandy Carter (bwrsandman) <bwrsandman@gmail.com>

pkgname=python-pythondialog
pkgver=3.5.0
pkgrel=1
pkgdesc="Python package for interfacing with dialog"
url="http://pythondialog.sf.net"
arch=('any')
license=('LGPL')
depends=('python' 'dialog')
source=("https://downloads.sourceforge.net/project/pythondialog/pythondialog/$pkgver/python3-pythondialog-$pkgver.tar.bz2"{,.asc})
sha256sums=('51760fd3ec65fcdd3055cc53a5f0e69caabfa9ad1e0154727ca17aa313f1a605'
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
