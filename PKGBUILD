# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>

pkgname=python-can
pkgver=4.0.0
pkgrel=1
pkgdesc="Python library to access CAN bus via SocketCAN, Kvaser's CANLIB, or CAN over Serial"
arch=('any')
url="https://pypi.python.org/pypi/python-can"
license=('LGPLv3')
makedepends=('python-setuptools')
depends=('python' 'python-aenum' 'python-wrapt')
source=(https://pypi.python.org/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('ce2bd6fdbe48a1a030701b9303d70855aed8fac2e33d340ae8eceea2d3c0d5701fd9cb53d8c4bffb13f5c7bf17cb22632aedb89c806df8b68552d5ea42479f02')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
	 cd "${srcdir}/${pkgname}-${pkgver}"
	 python setup.py install --root="${pkgdir}" --optimize=1
}
