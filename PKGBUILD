# Maintainer: Parmjot Singh <parmjotsinghrobot at gmail dot com>
pkgname=way-shell-git
pkgver=0.1
pkgrel=3
pkgdesc="A Gnome inspired desktop shell for Wayland compositors/window managers written in C and Gtk4."
arch=(x86_64)
url="https://github.com/ldelossa/way-shell"
license=('GPL-2.0')
depends=(libadwaita upower wireplumber json-glib libnm libpulse gtk4-layer-shell glib2)
makedepends=(meson cmake gtk-doc git)
optdepends=()
source=("git+https://github.com/ldelossa/${pkgname%-*}.git")
sha256sums=('SKIP')

build() {
	cd "${pkgname%-*}"
	make
}

package() {
	cd "${pkgname%-*}"
	make DESTDIR="$pkgdir/" install
}
