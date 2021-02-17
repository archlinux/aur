# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_supply_production
_name=trytond_sale_supply_production
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to supply sales from production"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('2a5f8523b9947cc96b0da70b14c0c2e09c09b4fd7c6ce209bd83e4ed5e79d9c6')
sha512sums=('0d684876e0798b05c715141520f3f73738fe076ce0e001fd048c4046d26ec32a4a12a294b93b5770d70271b2f37028865dd9838cada1029287ccdb1e407c243f')
b2sums=('014359d3d4a5ccd709a3aebc59ef0723cda65a40073138e0280766d64096106e6810d9cb5203ea9ea33dd55e6326df87f8370f4b22de92231c46f550b755b5b4')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
