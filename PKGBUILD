# Maintainer: Martin Rys <https://rys.rs/contact>
# Maintainer: Mike Gabriel <mike dot gabriel at das-netzwerkteam dot de>
# Contributor: Robert Tari <robert at tari dot in>

pkgname="libayatana-appindicator-glib"
pkgver=2.0.3
pkgrel=1
pkgdesc="Ayatana Application Indicators Shared Library (GLib-2.0 reimplementation, 100% GTK-free, 100% dbusmenu-free)"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/libayatana-appindicator-glib"
license=("GPL-3.0-or-later")
makedepends=("cmake-extras" "gi-docgen" "gobject-introspection" "vala" "glib2-devel")
depends=("glibc" "glib2")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('20292209616b34674e391fdbd6dfd23dfcee3ba9e04f67f30faac29bf4c2d3a4')

build() {
	cd ${pkgname}-${pkgver}
	cmake -S . -B build
	cmake --build build
}

package() {
	cd ${pkgname}-${pkgver}
	DESTDIR="${pkgdir}" cmake --install build
}
