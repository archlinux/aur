# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sandy Carter (bwrsandman) <bwrsandman@gmail.com>

pkgname=python-pythondialog
pkgver=3.5.1
pkgrel=2
pkgdesc="Python package for interfacing with dialog"
url="http://pythondialog.sf.net"
arch=('any')
license=('LGPL')
depends=('python' 'dialog')
makedepends=('python-setuptools')
source=("https://downloads.sourceforge.net/project/pythondialog/pythondialog/$pkgver/python3-pythondialog-$pkgver.tar.bz2"{,.asc})
sha512sums=('f032e425ce1ebac53ade1401e48625b5869497367f788831d08fd22eb3b3b14fa5aebd26fd3681b47222ef0247ebb5c1ead127f111ca296197e258650dd675ad'
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
