# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=undollar
pkgname=sh-$_pkgname
pkgver=0.0.0
pkgrel=1
pkgdesc="strip the dollar sign from the beginning of the terminal command"
arch=(any)
url=https://github.com/Freed-Wu/undollar
makedepends=(cmake)
license=(GPL3)
source=("$url/archive/$pkgver.tar.gz")
sha256sums=(SKIP)

build() {
	cd "$_pkgname" || return 1

	cmake -Bbuild -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	cd "$_pkgname" || return 1

	DESTDIR="$pkgdir" cmake --install build
}
