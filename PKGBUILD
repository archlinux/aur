# Maintainer: Senan Kelly <senan@senan.xyz>

pkgname=wlr-sunclock
pkgver=1.1.0
pkgrel=1
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
md5sums=('d06bdbc660446a3835bb8cb538222d11')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	meson --prefix /usr "$srcdir/build"
	ninja -C "$srcdir/build"
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
}
