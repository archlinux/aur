# Maintainer: Darvin Delgado <dnmodder@gmail.com>
pkgname=oversteer
pkgver=0.4
pkgrel=1
pkgdesc="Graphical application to configure Logitech Wheels."
arch=("any")
url="https://github.com/berarma/oversteer"
license=('GPL3')
depends=("python" "python-gobject" "python-pyudev" "python-evdev" "python-xdg" "gettext"  "appstream-glib" "desktop-file-utils")
makedepends=("meson")
source=("$pkgname-$pkgver.tar.gz::https://github.com/berarma/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("7e8a11a6b3a57ecb21484d75b2e60e551ee8fa172f830b75f92b787aebce3bcb")

build() {
	cd "$pkgname-$pkgver"
	meson build --prefix="/usr"
	ninja -C build
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir/" ninja -C build install
}
