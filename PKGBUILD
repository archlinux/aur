# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_payment_stripe
_name=trytond_account_payment_stripe
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module for Stripe payment"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('af2807243f89b5bcd6eda94d12b8693801932fd78d8bbcca39f0fc1f96564514')
b2sums=('3bcd1b3e6d8539c739dbbc8aa09927639665a83b59ecef5f35f738fdb4a72b22dc06b8e52bccef05880f14e16f749846ee7a77bc2e68dad151e6171cea6763b3')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
