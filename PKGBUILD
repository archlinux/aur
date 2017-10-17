# Maintainer: Pierre-Gildas MILLON <pgmillon@gmail.com>

pkgname=python2-pypac
pkgver=0.3.1
pkgrel=1
pkgdesc="Proxy auto-config and auto-discovery for Python"
arch=('any')
url="https://pypi.python.org/pypi/pypac/"
license=('Apache 2.0')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://github.com/carsonyl/pypac/archive/v$pkgver.tar.gz")
md5sums=('3221632b0b434c10162f281a849ba861')

build() {
  cd "${srcdir}/pypac-${pkgver}"
  python setup.py bdist_wheel
}

package() {
  cd "${srcdir}/pypac-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
