# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_deposit
_name=trytond_account_deposit
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module for accounting deposit"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6bb4d2154d50af8f121d8405efe4dfe7416954a6da4f674779651107060b7d30')
b2sums=('46a3f45d6df82f3fbeab3a0a5a008fa74d182fb28e239fb148bc5b2f135c65635637fbcc2967ca31735b6c0b269f12810eab0cd16bfe233cbb630e47771e5558')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
