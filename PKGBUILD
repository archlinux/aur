# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_party_relationship
_name=trytond_party_relationship
pkgver=5.6.0
_pkgdir=5.6
pkgrel=1
pkgbase=$_name
pkgdesc="Party Relationship module for Tryton"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('992d894f03d218aaaeaf5efd3e54d6dbe133e927c4bcb14fd63b70c3a0136caa')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
