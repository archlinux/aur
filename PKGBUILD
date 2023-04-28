# Maintainer: Martin Rys <rys.pw/contact>
# Previous Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

_pkgname=Flatseal
pkgname=flatseal
pkgver=2.0.0
pkgrel=2
pkgdesc='A permissions manager for Flatpak.'
url="https://github.com/tchx84/Flatseal/"
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=('flatpak' 'gjs' 'webkitgtk-6.0' 'libhandy' 'appstream-glib')
makedepends=('meson' 'flatpak-builder' 'ninja')
source=("$pkgname-$pkgver::https://github.com/tchx84/Flatseal/archive/v$pkgver.tar.gz")
sha256sums=('970b90692ce590dfe54c3195693a84c6ef0cd114c85a3928c2dfb15042efc622')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	meson setup --prefix /usr --buildtype=plain . build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	DESTDIR="$pkgdir" meson install -C build
}
