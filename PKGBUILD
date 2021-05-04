#Maintainer: Dylan Delgado <dylan1496 at live dot com>

_pkgname=executing
pkgname=python-executing
pkgver=0.6.0
pkgrel=1
pkgdesc="Get information about what a Python frame is currently doing, particularly the AST node being executed"
arch=('any')
url="https://github.com/alexmojaki/executing"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-pip')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('a07046e608c56948a899e1c7dc45327ed84ee67edf245041eb8c6722658c14e3')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}