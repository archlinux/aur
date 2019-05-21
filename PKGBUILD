# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=('nautilus-folder-icons' 'nemo-folder-icons')
pkgver=3.0
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/bilelmoussaoui/nautilus-folder-icons"
makedepends=('gnome-common' 'meson' 'gettext' 'appstream-glib')
options=('!emptydirs')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/bil-elmoussaoui/$pkgbase/archive/$pkgver.tar.gz")
sha256sums=('25fa6f164f50ed84ee6fa6d7a6004cb5190051847a5c3895f41bf1b426ad2565')

package_nautilus-folder-icons() {
	pkgdesc='Nautilus extension that makes changing folders icons easy!'
	depends=('gobject-introspection' 'gtk3' 'python-nautilus')

	cd "$pkgbase-$pkgver"
	meson builddir --prefix=/usr -Dfile_manager=nautilus
	DESTDIR="$pkgdir" ninja -C builddir install
}

package_nemo-folder-icons() {
	pkgdesc='Nemo extension that makes changing folders icons easy!'
	depends=('gobject-introspection' 'gtk3' 'nemo-python')

	cd "$pkgbase-$pkgver"
	meson builddir --prefix=/usr -Dfile_manager=nemo
	DESTDIR="$pkgdir" ninja -C builddir install
}
