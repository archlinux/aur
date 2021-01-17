# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_purchase
_name=trytond_purchase
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module for purchase"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6085178c825fe5c30628f4f902b3494a00ade8883af9eb9f08cb1029e3274759')
b2sums=('6e414b88d1844f6ad17085c4f169eeaa48d33856ce730b4c19c5e4b2115ce073a21353f61c15cfb26ed7b0d1f4b55dec43c27397dc1cab39732ff97262461c66')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
