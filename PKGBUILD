# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock_supply
_name=trytond_stock_supply
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for stock supply"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9caf8b6dcb6823091261c6e8c7d860ce6b061a91b50f958e5ab951fb69bf8f05')
sha512sums=('375923bae412662ee00c92b4752db0b67d594b75f036e859976a248c4a9f5038dbc2ff4a2aff4b56fde0c49079d5116ef0d4dee79e5f83832e6c49bc2874bd26')
b2sums=('03ec60fb7a167403e36200601f6871e5b996165747d4a4d8daa295192237ec449c8bf35a41555bbb3a58ed02ca3f5073c147c7e254d3fc3eab6418e8619cb346')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
