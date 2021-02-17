# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_analytic_invoice
_name=trytond_analytic_invoice
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to add analytic accounting on invoice"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f64ae0248d1ae4372f62a0c5500cae2969ca6c93930462d272b675cbca535e08')
sha512sums=('9a671c7184d5d921ea9aa72be66efc2c9fe0a3dd4792836b2ddc7095f0cffd03660b1098e89e2d007dcf189e1ba55f401b5bcb742cf80183e0dbedd5967e146c')
b2sums=('82e9fe0ada066aa49bf77ede0fb927d64528abd878cee79db28ea7a686d6f0abcbca076fb461ea84ba6759dadef23c7c88ab16cd6443833b0f3d5d188b29e0a8')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
