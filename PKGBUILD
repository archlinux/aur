# Maintainer: Max Mehl <aur at mehl dot mx>
# SPDX-FileCopyrightText: 2019 Max Mehl
# SPDX-License-Identifier: CC0-1.0

pkgname='python-boolean.py'
pkgver=3.8
pkgrel=1
pkgdesc='Implements boolean algebra in one module'
arch=('any')
url='https://github.com/bastikr/boolean.py'
license=('BSD-2-Clause')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-tox')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/bastikr/boolean.py/archive/v${pkgver}.tar.gz"
)
sha256sums=('9edea850c4e2a6a2c6e4a8653f9f694c9a0c385ef4493d72bcc5aff794d000b3')

check() {
  cd "$srcdir/boolean.py-$pkgver"
  python setup.py test
}

package() {
  cd "$srcdir/boolean.py-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et:
