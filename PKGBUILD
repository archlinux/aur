# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_cash_rounding
_name=trytond_account_cash_rounding
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module to round cash amount"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('80953f5d06bc43c590852527e55a0fd569a925d580083d797afb1853d18ef41d')
b2sums=('dddf6cd80dd98dbb5c8381b9994747bac9254a91d6e4f2a68382a88858f7add40b8a32df4a4c50a564e1b93213df15521b798353f29f8810ea1c0c2a5b93db77')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
