# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_commission
_name=trytond_commission
pkgver=5.8.2
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for commission"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('adef4b413ba08d536f4d1e6ca5a84ca1cf69b6bbd7d5f42f59eb9c6f419b3e91')
sha512sums=('b6bd0892c0c6867a77f3f6da2e67c08d3ca1c2a37aac0f9a0b9cb9c0d52f770071a8e9df4903087a98d55b981fbd2605842c6b54d22552c21b87623b9555cd46')
b2sums=('acdc57049a6c0db5c8e3b475aee87f7785b9d12a5fa8ea3a8efe8fbd8918b31479be688dcf75285b4fe25d9834c09030ee531fa84885699430f13980244e340c')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
