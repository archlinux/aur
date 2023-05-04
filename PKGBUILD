# Maintainer: Martin Rys <rys.pw/contact>
# Previous Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

_pkgname=Flatseal
pkgname=flatseal
pkgver=2.0.1
pkgrel=1
pkgdesc='A permissions manager for Flatpak.'
url="https://github.com/tchx84/Flatseal/"
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=('flatpak' 'gjs' 'webkitgtk-6.0' 'libhandy' 'appstream-glib' 'libadwaita')
makedepends=('meson' 'flatpak-builder' 'ninja')
source=("$pkgname-$pkgver::https://github.com/tchx84/Flatseal/archive/v$pkgver.tar.gz")
sha256sums=('81c9d4b47a57829ba58aa9a4046a733f918d851a663e866cd954068ea05f4d3e')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	meson setup --prefix /usr --buildtype=plain . build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	DESTDIR="$pkgdir" meson install -C build
}
