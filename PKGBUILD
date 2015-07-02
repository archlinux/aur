# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname="python2-oslo-rootwrap-liberty"
pkgver=2.0.0
pkgrel=1
pkgdesc="Oslo rootwrap - A root escalation wrapper for OpenStack"
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/oslo.rootwrap/"
license=("Apache")

depends=("python2"
	 "python2-six")

makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/o/oslo.rootwrap/oslo.rootwrap-${pkgver}.tar.gz")
md5sums=('1cd1ac826d29fdd1da9a030127e97034')

build() {
  cd "${srcdir}/oslo.rootwrap-${pkgver}/"
  python2 setup.py build
}

package() {
  cd "${srcdir}/oslo.rootwrap-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
