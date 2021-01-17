# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_statement_rule
_name=trytond_account_statement_rule
pkgver=5.8.2
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module to automate statement import with rules"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c4e51974a65953023684ce04f813f66c4e7f4877b7d7b6c5bde94a5d2951c2fe')
b2sums=('39ccd08231d3796c1d98a9b760d28cd4e20ce5658ccccec1cbaf96b80fed8bff51eea9733b070f2d32018cff1f7f23e084a3a93d68c61f59c046eb49c8b3061c')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
