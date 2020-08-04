# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_project_plan
_name=trytond_project_plan
pkgver=5.6.0
_pkgdir=5.6
pkgrel=1
pkgbase=$_name
pkgdesc="Tryton module to add planning capabilities on projects"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('975bd12e044bc62ffe421d577cd8cca4c77e13a216d33b7ab9cebcaa2a6335b5')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
