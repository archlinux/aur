# Maintainer: Martin Rys <rys.pw/contact>
# Previous Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

_pkgname=Flatseal
pkgname=flatseal
pkgver=2.0.2
pkgrel=1
pkgdesc='A permissions manager for Flatpak.'
url="https://github.com/tchx84/Flatseal/"
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=('flatpak' 'gjs' 'webkitgtk-6.0' 'libhandy' 'appstream-glib' 'libadwaita')
makedepends=('meson' 'flatpak-builder' 'ninja')
source=("$pkgname-$pkgver::https://github.com/tchx84/Flatseal/archive/v$pkgver.tar.gz")
sha256sums=('2ef0c6d9a28b8c472694943cade4bff3937e8a0f64222f20dc831484ae56fd9e')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	meson setup --prefix /usr --buildtype=plain . build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	DESTDIR="$pkgdir" meson install -C build
}
