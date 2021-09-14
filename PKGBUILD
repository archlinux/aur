#Maintainer: Dylan Delgado <dylan1496 at live dot com>

_pkgname=executing
pkgname=python-executing
pkgver=0.8.1
pkgrel=1
pkgdesc="Get information about what a Python frame is currently doing, particularly the AST node being executed"
arch=('any')
url="https://github.com/alexmojaki/executing"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-pip')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('f3dd49578371a633bd1ff5ca0af4afad65e6d549a06eb35ef20df198eced58ef')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
