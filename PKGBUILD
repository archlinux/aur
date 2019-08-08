# Maintainer: Max Mehl <aur at mehl dot mx>
# SPDX-FileCopyrightText: 2019 Max Mehl
# SPDX-License-Identifier: CC0-1.0

pkgname='python-boolean.py'
pkgver=3.6
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
sha256sums=('f4990b15caaea9a5843285004dd1cd829a94b6e539358d0a161a369ff206cecd')

check() {
  cd "$srcdir/boolean.py-$pkgver"
  python setup.py test
}

package() {
  cd "$srcdir/boolean.py-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et:
