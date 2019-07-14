# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_party_siret
_name=trytond_party_siret
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module to add SIRET/SIREN on parties"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4972393c7045bd559386be89b6e4cbf6789c9c21e5ab95afadaf3080eb401119')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
