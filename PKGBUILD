# Maintainer: Achmad Fathoni <fathoni DOT id AT gmail DOT com>

pkgname=mavproxy
_pkgname=MAVProxy
pkgver=1.8.40
pkgrel=1
pkgdesc='MAVLink proxy and command line ground station.'
arch=('any')
url='https://ardupilot.org/mavproxy'
license=('GPL3')
depends=(python python-pymavlink python-opencv)
makedepends=(python python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('cad317e2e879f1f7cb59af078788aaf0d09cd761ecd91ad091adf7ac6cc1bcdb')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}
