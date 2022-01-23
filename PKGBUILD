# Maintainer: Darvin Delgado <dnmodder@gmail.com>
pkgname=oversteer
pkgver=0.7.0
pkgrel=1
pkgdesc="Graphical application to configure Logitech Wheels."
arch=("any")
url="https://github.com/berarma/oversteer"
license=('GPL3')
depends=("python" "python-gobject" "python-matplotlib" "python-cairo" "python-pyudev" "python-evdev" "python-xdg" "gettext" "appstream-glib" "desktop-file-utils" "python-scipy")
makedepends=("meson")
source=("$pkgname-$pkgver.tar.gz::https://github.com/berarma/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('4426fa752e38e9f5d89584ba7d96b5570157b4ea076a89c38e7d6746aa926468')

build() {
	cd "$pkgname-$pkgver"
	meson build --prefix="/usr"
	ninja -C build
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir/" ninja -C build install
}

