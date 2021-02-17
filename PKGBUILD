# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_payment
_name=trytond_account_payment
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for payment"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('bb9c015f8501f0508e54594bf4004513b73efcf33485560c817d58a3d507d0a6')
sha512sums=('39688a63aceaea8507a88d522085387e12e515b82d175f66a66022fa13deb46ad1e7246593b2eaa8631cd1eda9e30f72553c6e920791a62e389002488e5962f9')
b2sums=('2e51440c498e749af10dfb741fda7d44f5715f6262737cfe99e5410d313ff60d2efc322ca4c7fec996c856b352e4107212fd8ddee404dbcb14c0ec6a7ea59030')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
