# Maintainer: Darvin Delgado <dnmodder@gmail.com>
pkgname=oversteer
pkgver=0.2.2
pkgrel=1
pkgdesc="Graphical application to configure Logitech Wheels."
arch=("any")
url="https://github.com/berarma/oversteer"
license=('GPL3')
depends=("python" "python-gobject" "python-pyudev" "python-xdg" "gettext"  "appstream-glib" "desktop-file-utils")
optdepends=("jstest-gtk-git: Test the steering wheel")
makedepends=("meson")
source=("https://github.com/berarma/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("429df91ee381e0fd1b0958ee5bb17adbb6458c6157b0193acc6f4ab63c48722e")

build() {
	cd "$pkgname-$pkgver"
	meson build --prefix="/usr"
	ninja -C build
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir/" ninja -C build install
}
