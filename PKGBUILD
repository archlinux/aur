# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=whatip
pkgver=1.0
pkgrel=1
pkgdesc="Info on your IP"
arch=('any')
url="https://gabmus.gitlab.io/whatip"
license=('GPL3')
depends=('gtk4' 'iproute2' 'libadwaita' 'python-requests' 'python-netaddr'
         'python-gobject')
makedepends=('meson' 'gobject-introspection')
optdepends=('avahi: hostname resolution')
source=("https://gitlab.gnome.org/GabMus/whatip/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('07a2abf7378b2398811353dfe5c2159aeaa11cc393cdccb2783b84a18c2e232b')

build() {
	arch-meson "$pkgname-$pkgver" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
