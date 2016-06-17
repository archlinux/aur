# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgbase=python-decorators
pkgname=('python-decorators' 'python2-decorators')
pkgname=python-decorators
pkgver=0.1
pkgrel=1
pkgdesc="Quickly create flexible Python decorators"
arch=(any)
url="http://github.com/firstopinion/decorators"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/e9/57/4ce9b1211b65d69db884fa912d912845c129ed6db833fa0c00ce43fb1f4d/decorators-${pkgver}.tar.gz")
sha256sums=('9d1ebf1c0ecb0cbb376c00d4b218ef3a0cc3c54ccdfd4c0884a75826c08f3a86')

package_python2-decorators() {
  depends=('python2')
  pkgdesc="Quickly create flexible Python decorators (python2 version)"
  
  cd "${srcdir}/decorators-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -v -m755 -d "${pkgdir}/usr/share/doc/python2-decorators"
  install -v -m644 README.rst "${pkgdir}/usr/share/doc/python2-decorators/"
}

package_python-decorators() {
  depends=('python')
  pkgdesc="Quickly create flexible Python decorators (python3 version)"

  cd "${srcdir}/decorators-${pkgver}"  
  python setup.py install --root="${pkgdir}/" --optimize=1

  install -v -m755 -d "${pkgdir}/usr/share/doc/python-decorators"
  install -v -m644 README.rst "${pkgdir}/usr/share/doc/python-decorators/"
}

# vim:set ts=2 sw=2 et:
