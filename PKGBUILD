# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_analytic_sale
_name=trytond_analytic_sale
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module to add analytic accounting on sale"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9ee3d4a08b2685de8cbd551fe93a1ba618427c7f8fbf4da240553a3be180714e')
b2sums=('162b30de3406efc53f039ec65d056d55846d8e991fbf8f3314e395ee94ac1ea4e7896d1a0b33640fcbc07b9e34237c253b28f8e2ddf9e7974677ed86e0a19bb0')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
