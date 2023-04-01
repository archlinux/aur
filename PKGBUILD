# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=python-pyblake2
pkgver=1.1.2
pkgrel=9
pkgdesc='BLAKE2 hash function for Python'
arch=('x86_64')
url='https://pythonhosted.org/pyblake2'
license=('custom')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/pyblake2/pyblake2-${pkgver}.tar.gz")
sha256sums=('5ccc7eb02edb82fafb8adbb90746af71460fbc29aa0f822526fc976dff83e93f')

build() {
  cd pyblake2-${pkgver}

  python setup.py build
}

package() {
  cd pyblake2-${pkgver}

  python setup.py install --root="${pkgdir}" --skip-build --optimize=1
  install -Dm644 -t "${pkgdir}/usr/share/licenses/python-pyblake2" COPYING
}
