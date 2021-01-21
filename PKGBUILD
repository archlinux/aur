# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=whatip
pkgver=0.3
pkgrel=1
pkgdesc="Info on your IP"
arch=('any')
url="https://gabmus.gitlab.io/whatip"
license=('GPL3')
depends=('libhandy' 'python-requests' 'python-netaddr' 'python-gobject')
makedepends=('git' 'meson' 'gobject-introspection')
#checkdepends=('appstream')
optdepends=('avahi: hostname resolution')
source=("https://gitlab.gnome.org/GabMus/whatip/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('88e27e4d8859465108a8aa9ef03cb4c4038b004481cf7f433f8c298c2d03e324')

build() {
	arch-meson "$pkgname-$pkgver" build
	meson compile -C build
}

#check() {
#	meson test -C build
#}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
