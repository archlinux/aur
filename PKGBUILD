# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_payment
_name=trytond_sale_payment
pkgver=5.6.0
_pkgdir=5.6
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module that manage payments on sale"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('016d0d9cc6bcb6bbd251114257c0fa6852bd80b638847cfa3c5fafa9a563b65a')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
