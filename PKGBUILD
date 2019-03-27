# Maintainer:
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=cddb-py
pkgver=1.4
pkgrel=8
pkgdesc="CDDB-Server access from Python"
arch=('x86_64')
url="http://cddb-py.sourceforge.net"
license=('GPL')
depends=('python2')
source=(https://downloads.sourceforge.net/sourceforge/cddb-py/CDDB-${pkgver}.tar.gz)
sha512sums=('578ef74313cd164f28682ed7e8b26e7c4e7fbac972f7c3c2fecfe31e6bc2ea8dff0c79adf9b6fda77402f9855d809819f56c23e4ffa68404d8cde479a15f740a')

package() {
  cd CDDB-${pkgver}
  sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' CDDB.py DiscID.py
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
