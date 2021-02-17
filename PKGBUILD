# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_product
_name=trytond_account_product
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to add accounting on product"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('5f743f8b1e62c687e500b5e664db5aa9e26d0babcd4b552a4d70515ae75c7781')
sha512sums=('670c4ce62a9f83c54ae1c7ff97b05dfc53203e8b823681bbd4b916a510baf73c244df1fe8132544575d5c32424ef7d02efe83e4021d52b39181f7a010dfe9b77')
b2sums=('e044feaf8125e7ea90193c2002c1deafc74c6b875b4faaebc77b679d9813dbd1b9620964577ab645033f8fcb8fb7a8fa2c4fd1fca06bcdd7f2ecf6252c165cd9')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
