# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname="python2-pysaml2"
pkgver=2.4.0
pkgrel=1
pkgdesc="Python implementation of SAML Version 2"
arch=("any")
url="https://pypi.python.org/pypi/pysaml2"
license=("Apache")
provides=("python2-pysaml2")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/p/pysaml2/pysaml2-${pkgver}.tar.gz")
sha256sums=('a26804150ddc5da803d0df4b7026b613a3571c387fd6d107f6263aabf2c84ec6')

build() {
  cd "${srcdir}/pysaml2-${pkgver}/"
  python2 setup.py build
}

package_python2-pysaml2() {
  depends=('python2-repoze.who-openstack' 'python2-pyasn1' 'xmlsec' 'python2-mako' 'memcached' 'python2-memcached')
  cd "${srcdir}/pysaml2-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
