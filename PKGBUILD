# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_promotion
_name=trytond_sale_promotion
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for sale promotion"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a7c034d0092450071aa2c9cb00008be58e5fdb5f1831543b1b83c161eb122050')
sha512sums=('d8a105ef4725574c2186e237f2fe07b4ab78273d899f83f3bdff248e07ad4c49eb4cc0ce8cbcf6e852ae385eaf6965b2d6bdc8524aa6383ea048f92ca339df6e')
b2sums=('45155e526ffc695bef517716cb5ad9343e7471ed1654c0528c6cc8a218901babba767f69c618e3d30e67c1ab26d0a15172603894986634d04118d5b058a2fd13')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
