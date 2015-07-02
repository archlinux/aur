# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname="python2-oslo-context-liberty"
pkgver=0.4.0
pkgrel=1
pkgdesc="Oslo Context library"
arch=("any")
url="https://pypi.python.org/pypi/oslo.context"
license=("Apache")
provides=("python2-oslo-context")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/o/oslo.context/oslo.context-${pkgver}.tar.gz")
sha256sums=('c980463a7ae5ceb83e8df89ca9ed351d813752f4ce62cdfe7b517c02b7b02c8c')

build() {
  cd "${srcdir}/oslo.context-${pkgver}/"
  python2 setup.py build
}

package_python2-oslo-context-liberty() {
  depends=('python2-babel>=1.3' 'python2-pbr>=0.6')
  cd "${srcdir}/oslo.context-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
