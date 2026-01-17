# Maintainer: Parmjot Singh <parmjotsinghrobot at gmail dot com>
pkgname=way-shell
pkgver=0.0.10
pkgrel=1
pkgdesc="A Gnome inspired desktop shell for Wayland compositors/window managers written in C and Gtk4."
arch=(x86_64)
url="https://github.com/ldelossa/way-shell"
license=('GPL-2.0')
depends=(libadwaita upower wireplumber json-glib libnm libpulse gtk4-layer-shell glib2)
makedepends=(meson cmake gtk-doc git)
optdepends=()
conflicts=(way-shell-git)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('180bc557a1e7dd4ff76440aa0dc71c152391b49ce6e205791d937f5001240177')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
