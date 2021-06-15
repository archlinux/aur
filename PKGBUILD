# Maintainer: Max Mehl <aur at mehl dot mx>
# SPDX-FileCopyrightText: 2019 Max Mehl
# SPDX-License-Identifier: CC0-1.0

pkgname='python-license-expression'
pkgver=21.6.14
pkgrel=1
pkgdesc='Utility library to parse, normalize and compare License expressions for Python using a boolean logic engine'
arch=('any')
url='https://github.com/nexB/license-expression'
license=('Apache-2.0')
depends=('python')
makedepends=('python-setuptools' 'python-boolean.py' 'python-pip')
checkdepends=('python-tox')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/nexB/license-expression/archive/v${pkgver}.tar.gz"
)
sha256sums=('96d8652c014fced7b0b68ad275452ee7b22f45f290654e22b3cdcb19d7c17c0b')

check() {
  cd "$srcdir/license-expression-$pkgver"
  python setup.py test
}

package() {
  cd "$srcdir/license-expression-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et:
