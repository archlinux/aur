#Maintainer: Dylan Delgado <dylan1496 at live dot com>

_pkgname=executing
pkgname=python-executing
pkgver=0.8.0
pkgrel=1
pkgdesc="Get information about what a Python frame is currently doing, particularly the AST node being executed"
arch=('any')
url="https://github.com/alexmojaki/executing"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-pip')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('77ed91874d321338865ea2bf7337636a5de8e9a7f8323527d29c4fad2a1b48f7')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
