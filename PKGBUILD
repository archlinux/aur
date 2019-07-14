# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_project
_name=trytond_project
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module with projects"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('aeca9b9048bbef5c7e2f49562e51eb72038c6fea89be866cf14aee0a99d407fb')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
