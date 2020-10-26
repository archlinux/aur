# Maintainer: Darvin Delgado <dnmodder@gmail.com>
pkgname=oversteer
pkgver=0.5.5
pkgrel=1
pkgdesc="Graphical application to configure Logitech Wheels."
arch=("any")
url="https://github.com/berarma/oversteer"
license=('GPL3')
depends=("python" "python-gobject" "python-matplotlib" "python-pyudev" "python-evdev" "python-xdg" "gettext"  "appstream-glib" "desktop-file-utils")
makedepends=("meson")
source=("$pkgname-$pkgver.tar.gz::https://github.com/berarma/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("b522125a12ee6f6f9a4ba15e10ee1f47cca75c644f39f6dd45fdbf83f3e4b3e3")

build() {
	cd "$pkgname-$pkgver"
	meson build --prefix="/usr"
	ninja -C build
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir/" ninja -C build install
}
