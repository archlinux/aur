# Maintainer: Nikola Hadžić <nikola.hadzic.000@protonmail.com>
pkgname="marg"
pkgver="0.3"
pkgrel=1
epoch=
pkgdesc="Bad CLI argument parsing library"
arch=("x86_64")
url="https://gitlab.com/NH000/marg"
license=("LGPL3")
makedepends=("make" "gcc" "coreutils" "binutils")
options=("staticlibs")
source=("$pkgname-$pkgver::git+$url#tag=a287a10de1b07ccfd93628e62cb7dae124267fdf")
sha256sums=("SKIP") 

build () {
	cd "$pkgname-$pkgver"
	make lib OPTIMIZE=1
	make lib LIBRARY=static OPTIMIZE=1
}

package() {
	cd "$pkgname-$pkgver"

    make install-lib LIBDEST="$pkgdir/usr/lib"
    make install-lib LIBRARY=static LIBDEST="$pkgdir/usr/lib"

    make install-headers HEADDEST="$pkgdir/usr/include/marg"

    make install-man MANDEST="$pkgdir/usr/share/man"
}
