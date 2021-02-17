# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_payment_sepa
_name=trytond_account_payment_sepa
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for SEPA payment"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('25d7147bb329d0d1dd4ed46a260801fcaa9292fce4033b5c4bda664609332493')
sha512sums=('a132ce2937cd5128a2df84e3777c6b720821b172689fdebd5bd5c3bf3903b23e8cc7d4979c05ecc30faca6c34188f7367ca8c813aa4c72e49fa8f126b3b8a526')
b2sums=('ac665390942e8f72a21ff9cac2169c12aadb445c1e317eb8e5c42c40b9262990f864d678af1d95fdda382bda4e977958042f75391a229f7ca14d08e778fa9603')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
