# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgbase=python-pyprint
pkgname=('python-pyprint' 'python2-pyprint')
pkgname=python-pyprint
pkgver=0.2.6
pkgrel=1
pkgdesc="A library providing printing facilities for python applications"
arch=(any)
url="https://pypi.python.org/pypi/PyPrint"
license=('GPL')
makedepends=('python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/6a/09/68f35c1184b2742b75daffac213e5e13dca59522a17dc77fb618be5c6010/PyPrint-0.2.6.tar.gz")
sha256sums=('fa0e1c140b392b76f2028543fa70bae47900120282b119859cdde664d167b0e2')

package_python2-pyprint() {
  depends=('python2')
  pkgdesc="A library providing printing facilities for python applications. (python2 version)"
  
  cd "${srcdir}/PyPrint-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -v -m755 -d "${pkgdir}/usr/share/doc/python2-pyprint"
  install -v -m644 README.rst "${pkgdir}/usr/share/doc/python2-pyprint/"
}

package_python-pyprint() {
  depends=('python')
  pkgdesc="A library providing printing facilities for python applications. (python3 version)"

  cd "${srcdir}/PyPrint-${pkgver}"  
  python setup.py install --root="${pkgdir}/" --optimize=1

  install -v -m755 -d "${pkgdir}/usr/share/doc/python-pyprint"
  install -v -m644 README.rst "${pkgdir}/usr/share/doc/python-pyprint/"
}
