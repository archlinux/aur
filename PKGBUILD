# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_attendance
_name=trytond_attendance
pkgver=5.8.2
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for recording employee attendance"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('3b9b13eab245e87bb19365eb88ba93ee84646570c151a5534efb3c5f1dd931d5')
sha512sums=('c347e4b0eb83adc01c6990142003e68b943a957da685cee5882598ec3a5812e181672cffcd8ffa9bbc315964056d2dae49e34742b1244ac3bf4742f27f63759c')
b2sums=('a2b830bcc4f60abac8ca78d792b286a7a8802137b1b9ddd79651415f5179588868be903e4ee0d6ccb35a9f8b47a0093549ebdd17665e6f93209054b229032fbb')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
