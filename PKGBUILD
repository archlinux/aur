# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock
_name=trytond_stock
pkgver=5.8.3
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for stock and inventory"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('193bc3adfb2a9e483c4f3e07ab0f4677132e7a390c833e5913314c4b7eb0b7ae')
sha512sums=('cb49c1c95b4cda58eb37d336aa91567f9855e963f8ad3bfa8ed58bfb4e4d915096d9def1f57c6ec8c3e19093627a1d378268bb6a9e1235f6b89a940ac16daff4')
b2sums=('40481466514e7b98f9801e4818fc4e135b876cd2267827f42f0494904300c3b1817ba9e2fc817e83b8cd9079a540534b895a7c0da741baccff9e8aa53f481c49')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
