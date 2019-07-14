# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_project_revenue
_name=trytond_project_revenue
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module to add revenue on project"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c39ffcd591f58e475bb782df9fc4e4d595a4c8692ba59a9c0834e5578ae41923')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
