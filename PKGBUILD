# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_price_list
_name=trytond_sale_price_list
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to add price list on sale"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('43d00a0d96e0d6a7a7a1a345093f3705a5ac576d2c50149c487c719ccd7b481a')
sha512sums=('44b7cae76979be84d5acf2487225ad29513d46e5d40abd3feecae79c872650ccee87e534d4a6880fadeb45d190d0725cb6e53ba65cf826e7c8b20c694cf2c103')
b2sums=('8e34edf3e91395b8b810e700a9122dff6568f4d4c1762216ceebe9bb8393444300c7270ef7f3e13f71031ab7cc9508f8365bb7cdfa026aea350e2157f545a1b6')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
