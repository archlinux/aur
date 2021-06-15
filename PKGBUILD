# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=('python-plasmalights' 'python2-plasmalights')
_name=${pkgname#python-}
pkgver=2.0.0
pkgrel=1
pkgdesc="Plasma LED driver, FX Sequencer and plugins for Pimoroni."
arch=('any')
url="https://github.com/pimoroni/plasma"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")

sha512sums=('e1af028350ed3cd1c886866f501cff510ec0830697fdce86c96bd0ef7e2f60789455320f9734b7f7ea9ecc19f11bf34a6aae365bdbdeecc33b0b62c5617749aa')

prepare() {
  cp -a plasmalights-$pkgver{,-py2}
}

package_python-plasmalights() {
  depends=('python')
  cd plasmalights-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-plasmalights() {
  depends=('python2')
  cd plasmalights-${pkgver}-py2
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
