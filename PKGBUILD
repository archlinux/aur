# Maintainer: Max Mehl <aur at mehl dot mx>
# SPDX-FileCopyrightText: 2019 Max Mehl
# SPDX-License-Identifier: CC0-1.0

pkgname=reuse
pkgver=0.11.1
pkgrel=1
pkgdesc='Helper tool for providing and confirming copyright and licensing information'
arch=('any')
url='https://github.com/fsfe/reuse-tool'
license=('GPL-3.0-or-later' 'Apache-2.0' 'CC-BY-SA-4.0' 'CC0-1.0')
depends=('python'
         'git'
         'python-debian'
         'python-requests'
         'python-jinja'
         'python-binaryornot'
         'python-boolean.py'
         'python-license-expression')
makedepends=('python-setuptools')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/fsfe/reuse-tool/archive/v${pkgver}.tar.gz"
)
sha256sums=('49d7e73968f7f5ac9ba7763daca31167ac0efc69ead95bfe40d12d5a7fb2bd6c')

package() {
  cd tool

  python setup.py -q install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et:
