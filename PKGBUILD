# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_invoice_stock
_name=trytond_account_invoice_stock
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to link stock and invoice"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('bb7c62fd4860933885515dbc208f34137c9968b9bdbcdf5a204ca1c1d88ca60a')
sha512sums=('d090dec33406143054ac5e95169b1705dd604195ab72a783333ce50ff493d752b74f75372df625c2db15179efd9576dc0b5b6ad5d5bab929dbd26b15cfe3ecad')
b2sums=('7db442a56234c044fb2cb15c01bd5a86719c8a937b32593907b7ab83cad3ef0f8f46586fcfd034230c28e65de43628c40789659eb52be0ed5524cb0460dceefa')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
