# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_production_split
_name=trytond_production_split
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to split production"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c4c095ec1615c111b3e6bf9ab389998484d22f0a7c9b798a18bcd15bf6a38c66')
sha512sums=('f82be70a48f050b16086fa332ee751a87c8f1a0762dbe05a932e3ef8b0e3af4ba3373d9f411c95363e9c6bc004b5fa0f48d74b8c4cde1a09016d3e856dce2f3e')
b2sums=('34582858e76c483f214d0504551a177952372c9bee7ca1f7cd06675d5098b6ee4dec578c1e650921b0fc5270f0e8612e1d23b89f6b4caa94a81739d5288952e0')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
