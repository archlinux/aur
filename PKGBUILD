# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_price_list
_name=trytond_sale_price_list
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module to add price list on sale"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('43d00a0d96e0d6a7a7a1a345093f3705a5ac576d2c50149c487c719ccd7b481a')
b2sums=('8e34edf3e91395b8b810e700a9122dff6568f4d4c1762216ceebe9bb8393444300c7270ef7f3e13f71031ab7cc9508f8365bb7cdfa026aea350e2157f545a1b6')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
