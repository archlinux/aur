# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=undollar
pkgname=sh-$_pkgname
pkgver=0.0.2
pkgrel=1
pkgdesc="strip the dollar sign from the beginning of the terminal command"
arch=(any)
url=https://github.com/Freed-Wu/undollar
makedepends=(cmake)
license=(GPL3)
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('e730cd9bc3f7e87a86b96bd1012961c3cd76e093e2cd0c6d70622c281a58963d')

build() {
	cd "$_pkgname" || return 1

	cmake -Bbuild -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	cd "$_pkgname" || return 1

	DESTDIR="$pkgdir" cmake --install build
}
