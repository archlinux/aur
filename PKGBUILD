# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_history
_name=trytond_sale_history
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to historize sales"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('76915c015adc5160acebf6c250799ecd1fe4b4282b0030eb598cab4cf5dc3008')
sha512sums=('c894f7757f1fc7be350255dec1e6e80f86ca8a843cd721a37ade0d29d03cba474aa673c5bb3009bcf2f331d2ef10f115e7f252bedb8e5c187ca9a9103a3c66bf')
b2sums=('4fcb44f739e92c41162302bea4ac8967fe77f981f3f84e5d0ff231e90d3c04a4f14d874c3c1e467ffe4c63d40f13e0d1a6dfd0a076b7ef808ce860b66246ace1')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
