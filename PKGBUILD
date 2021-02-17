# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_analytic_sale
_name=trytond_analytic_sale
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to add analytic accounting on sale"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9ee3d4a08b2685de8cbd551fe93a1ba618427c7f8fbf4da240553a3be180714e')
sha512sums=('ee4da52519c0e6c094d5574cefc05a6aa88739da2a22a4276095441951aa77f99475b18f5709ea8d21c3c9e0221b6ee8eaa651f7252b46eae52ed2b27fda79ba')
b2sums=('162b30de3406efc53f039ec65d056d55846d8e991fbf8f3314e395ee94ac1ea4e7896d1a0b33640fcbc07b9e34237c253b28f8e2ddf9e7974677ed86e0a19bb0')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
