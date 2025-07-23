# Copyright (C) 2025 Eser KUBALI <lxldev.contact@gmail.com>
# SPDX-License-Identifier: GPL-3.0-or-later
#
# This file is part of vglog-filter and is licensed under
# the GNU General Public License v3.0 or later.
# See the LICENSE file in the project root for details.
pkgname=vglog-filter
pkgver=1.0.0
pkgrel=2
pkgdesc="A log filtering tool for Valgrind logs."
arch=('x86_64')
url="https://github.com/eserlxl/vglog-filter"
license=('GPL3')
validpgpkeys=('F677BC1E3BD7246E')
depends=()
makedepends=('cmake' 'make' 'gcc')
source=("https://github.com/eserlxl/vglog-filter/releases/download/1.0.0/vglog-filter-1.0.0.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  bash ./build.sh performance warnings
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 build/vglog-filter "${pkgdir}/usr/bin/vglog-filter"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
b2sums=('b637c7efe74fa5132184b56d1f4871e11cbe02bb4426055c6c784a53e722ea79f99ad0889e10e0884c3336c9e765bfd63ecc36c7ea4bc83095c4dc03578b5679')
