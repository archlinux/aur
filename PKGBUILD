# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_promotion
_name=trytond_sale_promotion
pkgver=5.6.0
_pkgdir=5.6
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module for sale promotion"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('17fe709d51d76f862ac41dc7d758adf012577c92a419b7f695aa8c93e21e7546')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
