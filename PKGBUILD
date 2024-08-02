# Maintainer: Parmjot Singh <parmjotsinghrobot at gmail dot com>
pkgname=way-shell
pkgver=0.0.7
pkgrel=1
pkgdesc="A Gnome inspired desktop shell for Wayland compositors/window managers written in C and Gtk4."
arch=(x86_64)
url="https://github.com/ldelossa/way-shell"
license=('GPL-2.0')
depends=(libadwaita upower wireplumber json-glib libnm libpulse gtk4-layer-shell glib2)
makedepends=(meson cmake gtk-doc git)
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8ba58f19f6d047a820846ba61d9a7f8f61714f61ced0303a47204e7ebe0c3ba6')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
