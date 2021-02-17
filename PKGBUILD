# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_production_routing
_name=trytond_production_routing
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for production routing"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('22d4079fe556ea4c2ff6860614a6989bdd6f19ae33940d639d1740a77b98a7aa')
sha512sums=('e6f1de121d5e53bdb44248ccb03617d2c866562fff5864467f4059b7a3d49f0743aec22657faa8e91c304fdae9f3e5cb19a0a3ad31d1e32ca9b766ea49cd5ee3')
b2sums=('62c8f2006e3a8ce9e4b7a4703a78e8ef3c4508dfc6e436ee157316896f85e7cd796588097c5b307ce27cd4ab7164876e7abf9e6ea0e9556200fcc0ebe32fb0bb')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
