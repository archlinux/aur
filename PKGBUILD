# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_payment
_name=trytond_sale_payment
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module that manage payments on sale"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('0c4258315cd1d29e3284e61c9266a53ae6c9363424fd5f7ebe8b474289e29f46')
b2sums=('678937e25ed0d7882a65fe07f5b5072f16233f9dd4856c7c4aa879ccda0c43075cbb5f0ca7072d0b4f1c84092277dcfdfa29c16765b0ac1a1aa8dde19fdc9f2d')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
