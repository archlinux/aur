# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_tax_cash
_name=trytond_account_tax_cash
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to support tax report on cash basis"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('3217a3218176c9f7c65522f79988d9d12b2a6cafa6ce89d8ac59560a668e4d78')
sha512sums=('796665b19553dde2f5d0938df5c698ebf533a395d8793255364929cf52ec798d9289ae2d732ba846a5268735c57d285f0cd4dadb5e4a8ed895872d2d68dc10cd')
b2sums=('a157239568616afb50af1c32d9be4e4d30cde126f58f8b95934559fef1497a8c62327d5daa4c9902890dcb21cfe1d6b036ac64b9efcfa9c1accf2be1f9b0542d')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
