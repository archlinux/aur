# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_purchase
_name=trytond_purchase
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for purchase"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6085178c825fe5c30628f4f902b3494a00ade8883af9eb9f08cb1029e3274759')
sha512sums=('67a966e0f65c94e760fa1a104737e70e779d1751ab73e4bfd3f0814d2c413d03c88bdbec338fa168255021b4635646f85530dd3b0d4034829ad332c9a029c27b')
b2sums=('6e414b88d1844f6ad17085c4f169eeaa48d33856ce730b4c19c5e4b2115ce073a21353f61c15cfb26ed7b0d1f4b55dec43c27397dc1cab39732ff97262461c66')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
