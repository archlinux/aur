# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_product_classification
_name=trytond_product_classification
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to implement product classification"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('dd74a411fb52bf199020dfda11d600670715c33b95f5863950f28d0aa324c732')
sha512sums=('8942f4b3d858b49b7d10120686a5342259179c69238a6470e60df838e7d258491af50c5aec5bef882229593e5b6be9967062e224b884c1c7f6c230914179cd18')
b2sums=('d9770e8c9366bdba506034e0e4f9d15652420f6ed799374d69abd023865e40b03d2f7c8bb94a7f720d1ab478cdaf3f26f65ed8ec575f7dfde32502c37b51052d')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
