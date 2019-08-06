# Maintainer: smooz <smooz at mailbox dot org>
# Contributor: Dunon <josep.oliver at tutanota dot com>

pkgname=grevis
pkgver=0.2.1
pkgrel=1
pkgdesc="A simple game launcher"
arch=("any")
url="https://gitlab.com/dunon/grevis"
license=("GPL3")
depends=("python" "gtk3")
makedepends=("meson" "ninja")
conflicts=("grevis-git")
source=("https://gitlab.com/dunon/grevis/-/archive/${pkgver}/grevis-${pkgver}.tar.gz")
md5sums=("668f75f60b090c3bc48e92375b0f38ff")

package() {
	cd "grevis-${pkgver}"
	meson builddir --prefix="/usr"
	DESTDIR="$pkgdir" ninja -C builddir install
}
