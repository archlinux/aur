# Maintainer: Darvin Delgado <dnmodder@gmail.com>
pkgname=oversteer
pkgver=0.2.3
pkgrel=1
pkgdesc="Graphical application to configure Logitech Wheels."
arch=("any")
url="https://github.com/berarma/oversteer"
license=('GPL3')
depends=("python" "python-gobject" "python-pyudev" "python-xdg" "gettext"  "appstream-glib" "desktop-file-utils")
optdepends=("jstest-gtk-git: Test the steering wheel")
makedepends=("meson")
source=("https://github.com/berarma/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("ec487f40d3a5456cb769d7b69ea20d46a17cb4252426b7a96edd76d90186712c")

build() {
	cd "$pkgname-$pkgver"
	meson build --prefix="/usr"
	ninja -C build
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir/" ninja -C build install
}
