# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_opportunity
_name=trytond_sale_opportunity
pkgver=5.6.0
_pkgdir=5.6
pkgrel=1
pkgbase=$_name
pkgdesc="Tryton module with leads and opportunities"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('8e8a637cce553231de6ec3517664f94a46bdc02a0ac50714e2e1d0f8a4edbcb0')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
