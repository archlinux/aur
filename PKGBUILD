# Maintainer: Michael Beasley <youvegotmoxie@gmail.com>

pkgbase=pypy-lxml
pkgname=('pypy-lxml')
pkgver=3.4.4
pkgrel=1
arch=('i686' 'x86_64')
license=('BSD')
url="http://lxml.de/"
makedepends=('pypy' 'pypy3' 'libxslt')
source=(http://pypi.python.org/packages/source/l/lxml/lxml-${pkgver}.tar.gz)
sha1sums=('b210b84551d3ac1cadbcfae2fe553040fc7a61dd')
pkgdesc="PyPy binding for the libxml2 and libxslt libraries (EXPERIMENTAL!)"

package_pypy-lxml() {

  cd lxml-${pkgver}
  pypy setup.py install --root="${pkgdir}" --optimize=1

  install -Dm644 LICENSES.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 doc/licenses/BSD.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/BSD.txt
  install -Dm644 doc/licenses/elementtree.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/elementtree.txt
}
