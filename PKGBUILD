# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_purchase_request
_name=trytond_purchase_request
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for purchase requests"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('26f041c6a976664cc7e3abb49c4679cdd987cb6786563b10d856c7b7add522d5')
sha512sums=('ca2f8709005a563432a18d54feb50276a5f7c55f7f206888c62d08d3645955d9e32d25a5ac2599707b823e8a6c5024de3821bdd89a16d6ad2b011080b480dc1f')
b2sums=('4a5dec13c1ac2df3f19d894df75af14a17050558b07b880935f57bb5502f5e7b635e096927bb804ebf5e7c6208a72ac5639a24e41985419828f23076584060bc')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
