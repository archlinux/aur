# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_edocument_unece
_name=trytond_edocument_unece
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module for electronic document UNECE codes"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('84170cdad3f52ee2b8d67146777cd697c0e66be15b06232830310d6f5c026644')
b2sums=('79def8dd94311da2979f43ebd298da8ea1e2cd2f793564500fe3e95ebe82efec2aaf6bcd01788898857868eb91a35dfb285949990b048102a0a89e45817aee13')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
