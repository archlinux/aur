# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_analytic_invoice
_name=trytond_analytic_invoice
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module to add analytic accounting on invoice"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('30f904577b9137da48f40ef958f799a89ffa9dcfc7327a3206acfa6b401422f7')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
