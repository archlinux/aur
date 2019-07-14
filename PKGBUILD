# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account
_name=trytond_account
pkgver=5.2.2
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module for accounting"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('3a8431827d317f93da751d8bb372f8dc82f0856c1bc474e190bbdd7838804934')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
