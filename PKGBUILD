# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_currency
_name=trytond_currency
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module with currencies"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('bdd6038d4248f5d31f55c208948efa4576a2664e4686e1ced6d41e1a573cb72c')
sha512sums=('373d9ac4b166338e8eb1e8218f86f82cfb45b83f1071ccf3969e2ec8195a14f07a187f5b610784b35f2604ddfe4c3d51bfc333f08025e2328ab9801cc63eb094')
b2sums=('d98fedf7d6ab3c7011a6c10fa80899233ca91954705ca446d5f45e22b410ad9359703a5f9130fbb6373739733de9a26061d716824a0d06a8bb8bf8d264b7c66c')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
