# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=breathing
pkgver=0.1.1
pkgrel=1
pkgdesc="Exercise your breathing"
arch=(x86_64)
url=https://github.com/SeaDve/Breathing
license=(GPL3)
depends=(gstreamer gtk4 libadwaita python-gobject)
makedepends=(meson)
checkdepends=('appstream-glib')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('91564df8e77f71ec1717f57c118dddd5ebac8a2f2f648d9890980cd6219f43c84d2b434aa97059a558e58a8e203071793f0cc6426c0ddf88096c1b1e83ba492b')

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
