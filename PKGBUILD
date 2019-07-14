# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_payment_stripe
_name=trytond_account_payment_stripe
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module for Stripe payment"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('316b4ff3e04823b3a5c24418a0e05833bf1bb1b2bbdb1c77dfd8670408efb31a')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
