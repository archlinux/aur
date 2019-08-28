# Maintainer: smooz <smooz at mailbox dot org>
# Contributor: Dunon <josep.oliver at tutanota dot com>

pkgname=grevis
pkgver=0.2.1
pkgrel=1
pkgdesc="A simple game launcher"
arch=("any")
url="https://gitlab.com/josepoliver/grevis"
license=("GPL3")
depends=("python" "gtk3")
makedepends=("meson" "ninja")
conflicts=("grevis-git")
source=("https://gitlab.com/josepoliver/grevis/-/archive/${pkgver}/grevis-${pkgver}.tar.gz")
md5sums=("d6b566570fb4169144be96b00f51c16d")

package() {
	cd "grevis-${pkgver}"
	meson builddir --prefix="/usr"
	DESTDIR="$pkgdir" ninja -C builddir install
}
