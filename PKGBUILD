# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgbase=python-endpoints
pkgname=('python-endpoints' 'python2-endpoints')
pkgname=python-endpoints
pkgver=1.1.16
pkgrel=1
pkgdesc="Get an api up and running quickly."
arch=(any)
url="github.com/firstopinion/endpoints"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/31/0a/21fbf591a767faf484b83546b595ccb78790330c091561141e095bbb7057/endpoints-${pkgver}.tar.gz")
sha256sums=('356bff15aff88249c8c8b9a07e5d42aee50378640dde5ace432c2703ec17b849')

package_python2-endpoints() {
  depends=('python2')
  pkgdesc="Get an api up and running quickly. (python2 version)"
  
  cd "${srcdir}/endpoints-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -v -m755 -d "${pkgdir}/usr/share/doc/python2-endpoints"
  install -v -m644 README.rst "${pkgdir}/usr/share/doc/python2-endpoints/"
}

package_python-endpoints() {
  depends=('python')
  pkgdesc="Get an api up and running quickly. (python3 version)"

  cd "${srcdir}/endpoints-${pkgver}"  
  python setup.py install --root="${pkgdir}/" --optimize=1

  install -v -m755 -d "${pkgdir}/usr/share/doc/python-endpoints"
  install -v -m644 README.rst "${pkgdir}/usr/share/doc/python-endpoints/"
}

# vim:set ts=2 sw=2 et:
