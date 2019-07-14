# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_production_split
_name=trytond_production_split
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module to split production"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f2fbe6a25256580b2af6c3bf53ef1e0c0e49b2b0c38831738fab82762fa464fd')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
