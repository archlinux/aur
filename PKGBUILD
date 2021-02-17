# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_authentication_sms
_name=trytond_authentication_sms
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to authenticate users via SMS"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('0415c438e54e5bd20e6caaa60dd8b157a8b3837ccba61934d12a86e28ca85762')
sha512sums=('b40e7d589f508c69726afb11e4fc0bc6059227ebdee76aee383c8d0a09522020bc435c135824a0ecf68659122a750071c8c58017edb759a641592420636c1652')
b2sums=('27c4ea7d260f09dbb47c3cc77e3dd9edba565621dbcc1598f7ecc65a21a8e128280e6cfa35ca33c5ba53bfb6c5e30779071a8dcb2639fadc78653632538e62e3')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
