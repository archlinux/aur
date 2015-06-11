# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname="python2-oslo-rootwrap-kilo"
pkgver=1.6.0
pkgrel=1
pkgdesc="Oslo rootwrap - A root escalation wrapper for OpenStack"
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/oslo.rootwrap/"
license=("Apache")

depends=("python2"
	 "python2-six")

makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/o/oslo.rootwrap/oslo.rootwrap-${pkgver}.tar.gz")
md5sums=('dde8877cf09581a7dd24673806f778dd')

build() {
  cd "${srcdir}/oslo.rootwrap-${pkgver}/"
  python2 setup.py build
}

package() {
  cd "${srcdir}/oslo.rootwrap-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
