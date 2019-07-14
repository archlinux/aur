# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_opportunity
_name=trytond_sale_opportunity
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module with leads and opportunities"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ce0c021030db65d7fb7dbe1dd6b9055b75c94760c3a87de703e4ed01e31ff5ed')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
