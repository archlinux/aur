# Maintainer: Senan Kelly <senan@senan.xyz>

pkgname=wlr-sunclock
pkgver=1.2.0
pkgrel=2
pkgdesc='Displays a sunclock desktop widget using the layer shell protocol'
arch=(x86_64)
url='https://github.com/sentriz/wlr-sunclock'
license=('LGPL3')
groups=()
depends=('gtk4' 'gtk4-layer-shell' 'gobject-introspection')
makedepends=('git' 'meson' 'ninja')
provides=("${pkgname}-git")
conflicts=("${pkgname}-git")
replaces=()
backup=()
options=()
install=
source=("$pkgname-$pkgver.tar.gz::https://github.com/sentriz/${pkgname}/archive/v$pkgver.tar.gz")
noextract=()
md5sums=('131f7bb474999d911716fa863d48635d')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	meson setup --prefix /usr build
	ninja -C build
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" ninja -C build install
}
