# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=breathing
pkgver=0.1.4
pkgrel=1
pkgdesc="Relax and meditate"
arch=(x86_64)
url=https://github.com/SeaDve/Breathing
license=(GPL-3.0-or-later)
depends=(
python
gtk4
glib2
hicolor-icon-theme
libadwaita
python-gobject
gtk4
dconf
gstreamer
python-gobject
)
makedepends=(meson)
checkdepends=('appstream-glib')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('9497af224aef659cb81734ed3405b8f520cff08b52567aece2cacc62bf363ed06a2fcfbb0c5e3953d39ff8ec84fe8aea742d4906973db691984e964ab1caacc5')

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
