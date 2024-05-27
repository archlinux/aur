# shellcheck shell=bash disable=SC2034,SC2154
# Updated by https://github.com/lyokha/g3kb-switch/blob/master/.github/workflows/main.yml
pkgname=g3kb-switch
pkgver=1.5
pkgrel=1
pkgdesc="CLI keyboard layout switcher for GNOME Shell"
arch=(i686 x86_64 arm aarch64)
url=https://github.com/lyokha/g3kb-switch
depends=(glib2)
makedepends=(cmake)
license=(bsd)
source=("$pkgname-$pkgver::$url/archive/$pkgver.tar.gz")
sha256sums=('91bf59bf8bc132a146a0556f3e293d69ea00114bc16c106a4d37f7a0f2c06a18')

build() {
	cd "$pkgname-$pkgver" || exit 1
	cmake -DCMAKE_INSTALL_PREFIX=/usr -Bbuild
	cmake --build build
}

package() {
	cd "$pkgname-$pkgver" || exit 1
	DESTDIR="$pkgdir" cmake --install build
}
