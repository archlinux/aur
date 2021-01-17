# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_timesheet
_name=trytond_timesheet
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module with timesheets"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('71b6a56aefb8a4578a470d6cd9a6b2ff9561af5eceffc688abea5114adafd3a9')
b2sums=('7f200040115bb066a6d98f3d7213a9f7b046f1c891f7aed85542bf2f7e51816acf2c733dee1e2dcace7ca6e23da80c491f4f05eac9569b836452d7ed3952c8ad')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
