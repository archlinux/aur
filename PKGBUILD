# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname="python2-repoze.who-openstack"
pkgver=1.0.16
pkgrel=1
pkgdesc="WSGI Authentication Middleware"
arch=("any")
url="http://www.repoze.org"
license=("Custom")
provides=("python2-repoze.who")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/r/repoze.who/repoze.who-${pkgver}.tar.gz")
sha256sums=('0b016a2d29eb252935acafe4e889125fcb8d57b562a16f162b781857f5517704')

build() {
  cd "${srcdir}/repoze.who-${pkgver}/"
  python2 setup.py build
}

package_python2-repoze.who-openstack() {
  depends=('python2-paste' 'python2-zope-interface')
  cd "${srcdir}/repoze.who-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
