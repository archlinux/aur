# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account
_name=trytond_account
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for accounting"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('fcb42ea63f24ea6ec2aa578ddd65d23b10527b74cc94d6d9b36976cbf631de9a')
sha512sums=('e49bc1119cae64ec089ba41254d430cd438b96db5cc31e4ba47017fc51b2a9016b4267c53fdbcb2d403cabf6fe08f88a5a7889b57683a8a1fa18fc02e0e97ded')
b2sums=('432c2fefa73e98058373a6de406339c5f8659c9951e79c6cb0892bc6844c5e44befb15d836ff26f19128d9e923e55b84451a836ee3cbb1caf0ddfffe20711094')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
