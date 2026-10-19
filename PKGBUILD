# Copyright (C) 2026 Zhou Qiankang <wszqkzqk@qq.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, see <https://www.gnu.org/licenses/>.
#
# SPDX-License-Identifier: GPL-2.0-or-later
# Maintainer: Zhou Qiankang <wszqkzqk@qq.com>

pkgname=chem-grub
pkgver=r15.20261019.db7926b
pkgrel=1
pkgdesc='Chemistry-inspired GRUB2 theme with native localization and CJK support'
arch=('any')
url='https://github.com/wszqkzqk/chem-grub'
license=('GPL-2.0-or-later')
depends=('grub')
makedepends=('git' 'librsvg' 'make' 'python' 'python-fonttools' 'python-pillow')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git log -1 --format=%cd --date=format:%Y%m%d)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
    make
}

check() {
    cd "${pkgname}"
    make check
}

package() {
    cd "${pkgname}"
    make install DESTDIR="${pkgdir}"
}
