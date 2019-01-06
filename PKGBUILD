# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgbase=python-jsonpath-rw
pkgname=('python-jsonpath-rw' 'python2-jsonpath-rw')
pkgver=1.4.0
pkgrel=1
pkgdesc="A robust and significantly extended implementation of JSONPath for Python."
arch=('any')
url='https://github.com/kennknowles/python-jsonpath-rw'
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python' 'python2')
source=("https://github.com/kennknowles/python-jsonpath-rw/archive/${pkgver}.tar.gz")
sha256sums=('0aac3458f78b115e661a51610b631c46f27c8b6a4446e4dafb9a13b5ddb5d5e7')

check() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py test
  python2 setup.py test
}

package_python-jsonpath-rw() {
  depends=('python')
  pkgdesc="A robust and significantly extended implementation of JSONPath for Python3."

  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install --root=${pkgdir} 
}

package_python2-jsonpath-rw() {
  depends=('python2')
  pkgdesc="A robust and significantly extended implementation of JSONPath for Python2"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  python2 setup.py install --root=${pkgdir} 
  mv "${pkgdir}/usr/bin/jsonpath.py" "${pkgdir}/usr/bin/jsonpath2.py"
}

# vim:set ts=2 sw=2 et:
