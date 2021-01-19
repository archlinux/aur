# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_statement_aeb43
_name=trytond_account_statement_aeb43
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module to import AEB43 statements"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f7146dd9147f1862561c1a71fe282ed774bde79d6174d7884c07cd522abe3329')
b2sums=('63918ab4c49e43f34129bbb0d988d14e937ca1486fd0ff78e1aa8a5509b9ecb8b8477ad68262f43285d26f27676689817972ad773f3bac9866a2129348d3de35')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
