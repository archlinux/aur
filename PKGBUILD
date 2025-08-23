# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=breathing
pkgver=0.1.3
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
sha512sums=('1eed3b8b6e17135bd1e2c55c2a5f07cba298b93614e1005e157c9e404c7fc695ebb27b74d579306942a34f870e7b5554d03b5223881dc30da1375fd3beb8b6a1')

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
