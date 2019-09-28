# Maintainer: Darvin Delgado <dnmodder@gmail.com>
pkgname=oversteer
pkgver=0.3.1
pkgrel=1
pkgdesc="Graphical application to configure Logitech Wheels."
arch=("any")
url="https://github.com/berarma/oversteer"
license=('GPL3')
depends=("python" "python-gobject" "python-pyudev" "python-xdg" "gettext"  "appstream-glib" "desktop-file-utils")
optdepends=("jstest-gtk-git: Test the steering wheel")
makedepends=("meson")
source=("https://github.com/berarma/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("b61ff5f54a4fa55407cd9a5f2c190af9f17d26bfbbfccb1782da7dccf9d53741")

build() {
	cd "$pkgname-$pkgver"
	meson build --prefix="/usr"
	ninja -C build
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir/" ninja -C build install
}
