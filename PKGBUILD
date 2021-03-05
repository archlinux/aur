# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>

_pkgname=can
pkgname=python-${_pkgname}
pkgver=3.3.4
pkgrel=2
pkgdesc="Python library to access CAN bus via SocketCAN, Kvaser's CANLIB, or CAN over Serial"
arch=('any')
url="https://pypi.python.org/pypi/python-can"
license=('LGPLv3')
makedepends=('python-setuptools')
depends=('python' 'python-aenum' 'python-wrapt')
source=(https://pypi.python.org/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('cc4084c0348e1e0ef2372ebd863f2dfc85cae7315beb15d68f6e7d9531f05318d4307624bca13b3ae711ce219d3434183cd14d758d6073bf03db69d347eb7e6c')

build-python-can() {
    cd "${srcdir}/python-${_pkgname}-${pkgver}"
    python setup.py build
}

package_python-can() {
	 cd "${srcdir}/python-${_pkgname}-${pkgver}"
	 python  setup.py install --root="${pkgdir}" --optimize=1

     # Clean-up cruft, how can we make setup.py not do this?
     rm -rf ${pkgdir}/usr/lib/python*/site-packages/{examples,test}
}
