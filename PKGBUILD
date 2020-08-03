# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_edocument_unece
_name=trytond_edocument_unece
pkgver=5.6.0
_pkgdir=5.6
pkgrel=1
pkgdesc="Tryton module for electronic document UNECE codes"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('cfe2fb017c7e20dd728591bfa38cd59e2e50269e350d2b694efdb7ae9ee1be4c
0bf48c3deb1a5a40426f2e2074f91fbc234dc89265adaa9c6b3f162aa7204a17')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
