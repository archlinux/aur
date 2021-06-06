#
#   Copyright (C) 2018-2021 CASM Organization <https://casm-lang.org>
#   All rights reserved.
#
#   Developed by: Philipp Paulweber
#                 <https://github.com/casm-lang/casm-lang.pkg.archlinux>
#
#   This file is part of casm-lang.pkg.archlinux.
#
#   casm-lang.pkg.archlinux is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   casm-lang.pkg.archlinux is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with casm-lang.pkg.archlinux. If not, see <http://www.gnu.org/licenses/>.
#

# Maintainer: Philipp Paulweber <ppaulweber@casm-lang.org>

pkgname=casm
pkgver=0.6.0
pkgrel=1
pkgdesc="Corinthian Abstract State Machine (CASM)"
arch=('x86_64')
url="https://casm-lang.org"
license=('GPL3')
groups=('casm')

# depends=()
# makedepends=()
# checkdepends=()
# optdepends=()

provides=( "${pkgname}")
conflicts=("${pkgname}")

# replaces=()
# backup=()
# options=()
# install=
# changelog=
# source=("$pkgname-$pkgver.tar.gz"
#         "$pkgname-$pkgver.patch")
# noextract=()
# md5sums=()

sha256sums=('84205e16af98fbc7124ed9f5f1269825e3288b72fb549647c33e025d65538d87')

# validpgpkeys=()

source=("$pkgname-$pkgver.tar.gz::https://github.com/casm-lang/casm/releases/download/${pkgver}/${pkgname}-linux-$CARCH.tar.gz")

# prepare() {
# 	cd "$pkgname-$pkgver"
# 	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
# }

build() {
	cd "$pkgname-$pkgver"
	file bin/*
}

# check() {
# 	cd "$pkgname-$pkgver"
# 	make -k check
# }

package() {
	cd "$pkgname-$pkgver"
	mkdir -p ${pkgdir}/usr
	cp -r ./* ${pkgdir}/usr/
	chmod +x  ${pkgdir}/usr/bin/*
}
