# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=flatpost-git
pkgver=1.1.0.r0.g54fb9bf
pkgrel=1
pkgdesc="Desktop Environment agnostic flatpak-only shop gui"
arch=('any')
url="https://github.com/GloriousEggroll/flatpost"
license=('BSD-2-Clause AND GPL-3.0-or-later')
depends=('flatpak' 'python-requests' 'python-dbus' 'hicolor-icon-theme' 'gtk3' 'appstream' 'gdk-pixbuf2' 'python' 'glib2' 'python-gobject')
makedepends=('git')
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/$pkgname"
	DESTDIR="$pkgdir" make install
}
