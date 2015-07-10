# Maintainer: David Verelst <david dot verelst at gmail com>
# Contributor: richli
pkgname=python2-shapely
pkgver=1.5.6
pkgrel=1
pkgdesc="Manipulation and analysis of geometric objects in the Cartesian plane"
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/Shapely"
license=('BSD')
depends=('python2>=2.6' 'geos>=3.3')
source=("https://pypi.python.org/packages/source/S/Shapely/Shapely-${pkgver}.tar.gz")
md5sums=('3d1df5fc176005ab0ce110291ac60a5a')
 
package() {
  cd "$srcdir"/Shapely-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
 
  # replace any python occurances with python2
  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find "${pkgdir}" -name '*.py')
 
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
 
# vim:set ts=2 sw=2 et:
