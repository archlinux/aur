#Maintainer: Dylan Delgado <dylan1496 at live dot com>

_pkgname=stack_data
pkgname=python-stack-data
pkgver=0.1.1
pkgrel=1
pkgdesc="Python library that extracts data from stack frames and tracebacks"
arch=('any')
url="https://github.com/alexmojaki/stack_data"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-pip' 'git')
source=("git+https://github.com/alexmojaki/stack_data.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd ${srcdir}/${_pkgname}
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
