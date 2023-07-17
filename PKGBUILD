# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
pkgname=sh-manpager
pkgver=0.0.0
pkgrel=1
pkgdesc="Colorize $(man XXX)"
arch=(any)
url=https://github.com/Freed-Wu/$pkgname
depends=(bat ansifilter)
makedepends=(cmake)
license=(GPL3)
provides=(manpager)
conflicts=(manpager)
source=("$url/archive/$pkgver.tar.gz")
sha256sums=(SKIP)

build() {
	cd "$pkgname-$pkgver" || return 1

	cmake -Bbuild -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	cd "$pkgname-$pkgver" || return 1

	DESTDIR="$pkgdir" cmake --install build
}
