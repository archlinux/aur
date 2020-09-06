# Maintainer: Darvin Delgado <dnmodder@gmail.com>
pkgname=oversteer
pkgver=0.5.3
pkgrel=1
pkgdesc="Graphical application to configure Logitech Wheels."
arch=("any")
url="https://github.com/berarma/oversteer"
license=('GPL3')
depends=("python" "python-gobject" "python-pyudev" "python-evdev" "python-xdg" "gettext"  "appstream-glib" "desktop-file-utils")
makedepends=("meson")
source=("$pkgname-$pkgver.tar.gz::https://github.com/berarma/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("5f80f933e8d1a0655c5e05c12c84f9bd8aec86b2ac1b0a537d908da5ebe74dea")

build() {
	cd "$pkgname-$pkgver"
	meson build --prefix="/usr"
	ninja -C build
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir/" ninja -C build install
}
