# Maintainer: Dian M Fay <dian.m.fay@gmail.com>
pkgname=python-aalib
pkgver=0.4
pkgrel=1
pkgdesc="Python interface to the AAlib ASCII art library"
arch=("any")
url="https://pypi.python.org/pypi/$pkgname"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
conflicts=("${pkgname}" "${pkgname}-git")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('3fc183d60f7f51d11ef2ad9609655e5e3f4867b9af06dccab9b57de1040d8c15')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 || return 1
}
