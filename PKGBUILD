# Maintainer: Max Mehl <aur at mehl dot mx>
# SPDX-FileCopyrightText: 2019 Max Mehl
# SPDX-License-Identifier: CC0-1.0

pkgname='python-boolean.py'
pkgver=3.7
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
sha256sums=('9b4638c17f70eab189ebf3be326b893281dd8e47e408457a70293f7eea1b8cdc')

check() {
  cd "$srcdir/boolean.py-$pkgver"
  python setup.py test
}

package() {
  cd "$srcdir/boolean.py-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et:
