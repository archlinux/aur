# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname="python2-oslo-context-kilo"
pkgver=0.2.0
pkgrel=1
pkgdesc="Oslo Context library"
arch=("any")
url="https://pypi.python.org/pypi/oslo.context"
license=("Apache")
provides=("python2-oslo-context")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/o/oslo.context/oslo.context-${pkgver}.tar.gz")
sha256sums=('30bee9680a2bf5f947227cfd5996cebb17fd8c8e3013e5a594f7a7accb2947dd')

build() {
  cd "${srcdir}/oslo.context-${pkgver}/"
  python2 setup.py build
}

package_python2-oslo-context-kilo() {
  depends=('python2-babel>=1.3' 'python2-pbr>=0.6')
  cd "${srcdir}/oslo.context-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
