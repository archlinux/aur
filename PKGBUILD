# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_bank
_name=trytond_bank
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module with banks"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('68ba3ad0c5379c6929a6c972cc8154bc68d8581a841820071b7de682ece63084')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
