# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_tax_rule_country
_name=trytond_account_tax_rule_country
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module to add countries on tax rules"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6ac466a7ac1db4f55fb3d6b0a0df4ceb652240ec08b9d96011d60eacb7ad35b1')
b2sums=('bc7b39c05905905ec0f7729f676db8e6c14ff60ff23deb63bbf5366ca4e3d2318ca7dacd74a3810ba0a30482866bc40e1ab3d20c78c793c0d207de22256945dd')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
