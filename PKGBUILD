# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=breathing
pkgver=0.1.0
pkgrel=1
pkgdesc="Exercise your breathing"
arch=(x86_64)
url=https://github.com/SeaDve/Breathing
license=(GPL3)
depends=(gstreamer gtk4 libadwaita python-gobject)
makedepends=(meson)
checkdepends=('appstream-glib')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c0e70041eae65c91cd2dcbb18219a12b5325964cfdf965577b99454bfc6a05cb')

build() {
	arch-meson Breathing-$pkgver build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
