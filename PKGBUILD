# Maintainer: Max Mehl <aur at mehl dot mx>
# SPDX-FileCopyrightText: 2020 Max Mehl
# SPDX-License-Identifier: CC0-1.0

pkgname=reuse
pkgver=0.13.0
pkgrel=1
pkgdesc='Helper tool for providing and confirming copyright and licensing information'
arch=('any')
url='https://github.com/fsfe/reuse-tool'
license=('GPL-3.0-or-later' 'Apache-2.0' 'CC-BY-SA-4.0' 'CC0-1.0')
depends=('python'
         'git'
         'python-binaryornot'
         'python-boolean.py'
         'python-debian'
         'python-jinja'
         'python-license-expression'
         'python-requests')
makedepends=('python-pip'
             'python-setuptools')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/fsfe/reuse-tool/archive/v${pkgver}.tar.gz"
)
sha256sums=('0782a8d739e3c737cf2505feda16aef860fe4649d457192e21b2c51a732dd41c')

package() {
  cd "reuse-tool-${pkgver}"

  python setup.py -q install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et:
