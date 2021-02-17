# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_invoice_history
_name=trytond_account_invoice_history
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to historize invoices"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('94907f8ba0f3a422b0c4ae1153452059a6798581eae92a6c6a46959b97091da6')
sha512sums=('8c1f39472e3ea6f3bade6a5acfd79ba549f2f0038897588e251cd460205c42d20f6f5645507a0467d5e74867f98a861fbf5f8d158ac00acb01e3d38eeaacba18')
b2sums=('f8e777a39b5336753f682ac92efab245142f008dd97494c96b4a0c4c79469ea03850a5a943347a2f014d2b75884ab06548a77be4c0736b53797521ec407ed79f')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
