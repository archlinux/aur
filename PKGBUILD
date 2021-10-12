#Maintainer: Dylan Delgado <dylan1496 at live dot com>

_pkgname=executing
pkgname=python-executing
pkgver=0.8.2
pkgrel=1
pkgdesc="Get information about what a Python frame is currently doing, particularly the AST node being executed"
arch=('any')
url="https://github.com/alexmojaki/executing"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-pip')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('c23bf42e9a7b9b212f185b1b2c3c91feb895963378887bb10e64a2e612ec0023')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
