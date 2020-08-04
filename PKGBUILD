# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_purchase_history
_name=trytond_purchase_history
pkgver=5.6.0
_pkgdir=5.6
pkgrel=1
pkgbase=$_name
pkgdesc="Tryton module to historize purchases"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f329cccb891540ec2ac72c0f3cc43173c2ed9166de3bdcf82371aea8d8386cfa')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
