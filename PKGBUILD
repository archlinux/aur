# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_payment_clearing
_name=trytond_account_payment_clearing
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for payment clearing"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('2157037061a69de2c134aa986ce58256b574f20e554c80f4f5139d2eb8a343fc')
sha512sums=('73b4de07190b5bfb1d3ca2fc5fe89320027a888264926050b8e5969af3766e7ebc062397887e4f3df517ed87b2d6db82d8453c419d010317d673092fc4f379ad')
b2sums=('61ea6a0c92ca63e43158df6855fb619cb728c7ca1d0592ecb754e923cb8432947d823a823adab67b88d92c8c602d5b098e2f56e4022cd980e904d157e33bed8a')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
