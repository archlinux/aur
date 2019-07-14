# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_party
_name=trytond_party
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module with parties and addresses"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9f1079aa1ac5a77b9d2a26614bc116d5de42265a690f036d6695b2151da7a182')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
