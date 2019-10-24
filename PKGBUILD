# Maintainer: Max Mehl <aur at mehl dot mx>
# SPDX-FileCopyrightText: 2019 Max Mehl
# SPDX-License-Identifier: CC0-1.0

pkgname='python-license-expression'
pkgver=1.0
pkgrel=1
pkgdesc='Utility library to parse, normalize and compare License expressions for Python using a boolean logic engine'
arch=('any')
url='https://github.com/nexB/license-expression'
license=('Apache-2.0')
depends=('python')
makedepends=('python-setuptools' 'python-boolean.py')
checkdepends=('python-tox')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/nexB/license-expression/archive/v${pkgver}.tar.gz"
)
sha256sums=('cff181fbc43f40989f4b32685230b82c1f0d557aac15822c747f90cb6e9d26d0')

check() {
  cd "$srcdir/license-expression-$pkgver"
  python setup.py test
}

package() {
  cd "$srcdir/license-expression-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et:
