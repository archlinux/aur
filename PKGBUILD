# Maintainer: Achmad Fathoni <fathoni DOT id AT gmail DOT com>

pkgname=mavproxy
_pkgname=MAVProxy
pkgver=1.8.37
pkgrel=1
pkgdesc='MAVLink proxy and command line ground station.'
arch=('any')
url='https://ardupilot.org/mavproxy'
license=('GPL3')
depends=(python python-pymavlink python-opencv)
makedepends=(python python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('0527c65b55652a130c44c131cce5644cc5ac00a3f85edb81899f79f5e3ee16fb')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}
