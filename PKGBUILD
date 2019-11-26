# Maintainer: Dian M Fay <dian.m.fay@gmail.com>
pkgname=python-aalib
pkgver=0.3.2
pkgrel=1
pkgdesc="Python interface to the AAlib ASCII art library"
arch=("any")
url="https://pypi.python.org/pypi/$pkgname"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
conflicts=("${pkgname}" "${pkgname}-git")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=("c39071629e7962dcd926faf0135dc73e2a8eb5db9a53bc2ebe5965f8c39165a2")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 || return 1
}
