# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock_package
_name=trytond_stock_package
pkgver=5.8.2
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for stock packaging"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e47b539891fc42f0e1e4cc9f9d15aa54b34a92410259c7d225eaeb390fd3b1c8')
sha512sums=('8c4131986343163309e5edcf2bc5ef6023d7c0bf4d1fdac7295d1f6c4ae7d4d9b7f96b1d3dbc095b1d02223a34288608009ca0142ace40495ab136532e2eee54')
b2sums=('acaf60c11d1d37e5a813c093ddb98e4df2176bc5a617e8cde50051b7bb398116601161fdf91f62de6697f3379ee289d940010f9f0577ef19b34946d17a1c6cd6')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
