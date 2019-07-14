# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_asset
_name=trytond_account_asset
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module for assets management"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('968a1799b921754521f4c188654ba036b7ad2bf0b552c26d016a000540ea6ba6')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
