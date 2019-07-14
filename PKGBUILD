# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_party_relationship
_name=trytond_party_relationship
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Party Relationship module for Tryton"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9e3ffb61585ef4af4151d8d8336b7ed7271f2a478e741dc73779bcdd7108788d')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
