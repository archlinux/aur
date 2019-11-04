# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>

_pkgname=can
pkgname=(python-${_pkgname} python2-${_pkgname})
pkgver=3.3.2
pkgrel=1
pkgdesc="Python library to access CAN bus via SocketCAN, Kvaser's CANLIB, or CAN over Serial"
arch=('any')
url="https://pypi.python.org/pypi/python-can"
license=('LGPLv3')
makedepends=('python-setuptools' 'python2-setuptools')
depends=('python'
         'python-aenum')
source=(https://pypi.python.org/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('0247e6d0fd76ac412c46ea5b0a6b973ab045546d5b5e50d34d588e4adb7ad1ad8d652a290e33a3dfe2a963ac538b32c29d1e3cfbf5143202d1ec5d434a168751')

build-python-can() {
    cd "${srcdir}/python-${_pkgname}-${pkgver}"
    python setup.py build
}

build-python2-can() {
    cd "${srcdir}/python-${_pkgname}-${pkgver}"
    python2 setup.py build
}

package_python-can() {
	 cd "${srcdir}/python-${_pkgname}-${pkgver}"
	 python  setup.py install --root="${pkgdir}" --optimize=1

     # Clean-up cruft, how can we make setup.py not do this?
     rm -rf ${pkgdir}/usr/lib/python*/site-packages/{examples,test}
}

package_python2-can() {
	 cd "${srcdir}/python-${_pkgname}-${pkgver}"
	 python2 setup.py install --root="${pkgdir}" --optimize=1

     # Clean-up cruft, how can we make setup.py not do this?
     rm -rf ${pkgdir}/usr/lib/python*/site-packages/{examples,test}
}
