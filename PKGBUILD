# Maintainer: Darvin Delgado <dnmodder@gmail.com>
pkgname=oversteer
pkgver=0.6.0
pkgrel=1
pkgdesc="Graphical application to configure Logitech Wheels."
arch=("any")
url="https://github.com/berarma/oversteer"
license=('GPL3')
depends=("python" "python-gobject" "python-matplotlib" "python-pyudev" "python-evdev" "python-xdg" "gettext"  "appstream-glib" "desktop-file-utils" "python-scipy")
makedepends=("meson")
source=("$pkgname-$pkgver.tar.gz::https://github.com/berarma/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('3b68bef81ed5d3a52c2b9147eb5c05e81f021739e38383b50c96fd31379f32cd')

build() {
	cd "$pkgname-$pkgver"
	meson build --prefix="/usr"
	ninja -C build
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir/" ninja -C build install
}

