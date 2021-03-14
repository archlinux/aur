#Maintainer: Dylan Delgado <dylan1496 at live dot com>

_pkgname=pure_eval
pkgname=python-pure-eval
pkgver=0.1.1
pkgrel=1
pkgdesc="Safely evaluate AST nodes without side effects"
arch=('any')
url="https://github.com/alexmojaki/pure_eval"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-pip')
source=("git+https://github.com/alexmojaki/pure_eval.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd ${srcdir}/${_pkgname}
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}