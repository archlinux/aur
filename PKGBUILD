# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_deposit
_name=trytond_account_deposit
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for accounting deposit"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6bb4d2154d50af8f121d8405efe4dfe7416954a6da4f674779651107060b7d30')
sha512sums=('9f0c444d66af46b5b576852a1dbdd000b62b5c832b57af09c6def3220e6dbffc2028675e59a4841e474b862f267ff1bdca9b69d0191c9c80c502cee83e6bdccc')
b2sums=('46a3f45d6df82f3fbeab3a0a5a008fa74d182fb28e239fb148bc5b2f135c65635637fbcc2967ca31735b6c0b269f12810eab0cd16bfe233cbb630e47771e5558')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
