# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_purchase_secondary_unit
_name=trytond_purchase_secondary_unit
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module to add a secondary unit on purchase line"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('bcf7b0775ad5a82c34ad539b94a49f6f0e6e68731b9e4253b2c44f81bc4753d0')
b2sums=('06de7106123ecc455856646ad15ad78f5d68c342973efe28b07236965d7e34d63adf294621d19757ef6e50c661b67532fb8421c2ab7a80d3ebbe836458e32543')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
