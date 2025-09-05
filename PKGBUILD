# Copyright (c) 2025 The Pacenv developers
# Distributed under the MIT software license, see the accompanying
# file COPYING or https://opensource.org/license/mit/.

pkgname=pacenv
pkgver=0.1.1
pkgrel=1
pkgdesc="Creation and management of lightweight GNU/Linux environments"
arch=(any)
url="https://github.com/beryll1um/pacenv.git"
license=("MIT")
depends=("pacman" "json-c")
makedepends=("git" "pkg-config" "gcc" "meson")
source=("git+$url#tag=v$pkgver")
sha512sums=('SKIP')

_prefix=/usr/
_buildtype=release
_builddir=builddir/

build() {
	meson setup --prefix=$_prefix --buildtype $_buildtype $srcdir/$_builddir \
		$srcdir/$pkgname
	meson compile -C $srcdir/$_builddir
}

package() {
	meson install -C $srcdir/$_builddir --destdir $pkgdir
}

# vim: set ts=4 sw=4 noexpandtab:
