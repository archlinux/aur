# Maintainer: Your Name <youremail@domain.com>

# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD

# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154

pkgname=NAME
pkgver=VERSION
pkgrel=1
epoch=
pkgdesc=''
#arch=(any)
arch=(armv7h i686 x86_64)
url=''
license=('LicenseRef-SPDX-License-Identifier')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
  "$pkgname-$pkgver.tar.gz"
  "$pkgname-$pkgver.patch"
)
noextract=()
b2sums=()
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver" || exit 1
	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$pkgname-$pkgver" || exit 1 
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver" || exit 1 
	make -k check
}

package() {
	cd "$pkgname-$pkgver" || exit 1
	make DESTDIR="$pkgdir/" install
}

# vim:set sw=2 sts=-1 et:
