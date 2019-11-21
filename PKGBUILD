# Maintainer: Max Mehl <aur at mehl dot mx>
# SPDX-FileCopyrightText: 2019 Max Mehl
# SPDX-License-Identifier: CC0-1.0

pkgname='python-license-expression'
pkgver=1.2
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
sha256sums=('27e2a33ba833ece7a13068aba1c08d2aa6fe9d81acbf33ad284fe1e24200da98')

check() {
  cd "$srcdir/license-expression-$pkgver"
  python setup.py test
}

package() {
  cd "$srcdir/license-expression-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et:
