# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_production_outsourcing
_name=trytond_production_outsourcing
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to outsource production"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b150cb343aadd8019d43fbd44408716c4b5a668dc7e98c091280fc98d47106d1')
sha512sums=('c960e551625f434e9875fc1c802661363eba11dd60f10cb745fbbdf1f65aa9f1f9ba2d87a113b4946b93f015d5fa51c2f03a9db31ddd0eac4352eb0705cc9f2b')
b2sums=('adf90a20283b1a7e0ec62197e2c87843f80cd39e55ba8f2ca32e9f756a731c201d5ebfd88d9cb7f589c675fadf6d6273453f7d0cf664c81cef7347c89d28d480')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
