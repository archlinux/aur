# Maintainer: smooz <smooz at mailbox dot org>
# Contributor: Dunon <josep.oliver at tutanota dot com>

pkgname=grevis
pkgver=0.1.7
pkgrel=1
pkgdesc="A simple game launcher"
arch=("any")
url="https://gitlab.gnome.org/dunon/grevis"
license=("GPL3")
depends=("python" "gtk3")
makedepends=("meson" "ninja")
conflicts=("grevis-git")
source=("https://gitlab.gnome.org/dunon/grevis/-/archive/${pkgver}/grevis-${pkgver}.tar.gz")
md5sums=("bea323f190cf7cd931dcfd527c9093f6")

package() {
	cd "grevis-${pkgver}"
	meson builddir --prefix="/usr"
	DESTDIR="$pkgdir" ninja -C builddir install
}
