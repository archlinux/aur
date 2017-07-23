# Contributor: Dario Andres Rodriguez
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributer: Daniel J Griffiths <ghost1227@archlinux.us>
# Maintainer: Mauro Santos <registo.mailling@gmail.com>

pkgname=xcursor-polar
pkgver=1.4
pkgrel=2
pkgdesc="Polar XCursor Theme"
arch=('any')
url="https://store.kde.org/content/show.php?content=27913"
#url="https://www.gnome-look.org/p/999968/"
license=('GPL')
source=(https://dl.opendesktop.org/api/files/download/id/1460735356/27913-PolarCursorThemes.tar.bz2)
sha256sums=('03d77c528c89f507eb240d4efd2dfcb0b5d8245cd20c94f9cf8a87e50c16f598')

package() {
	mkdir -p "${pkgdir}"/usr/share/icons/{Polar,Polar-Green,Polar-Blue}

	cp -R "${srcdir}"/PolarCursorTheme/cursors "${pkgdir}"/usr/share/icons/Polar
	sed s/PolarCursorTheme/Polar/ -i "${srcdir}"/PolarCursorTheme/index.theme
	install -Dm644 "${srcdir}"/PolarCursorTheme/index.theme \
		"${pkgdir}"/usr/share/icons/Polar/index.theme

	cp -R "${srcdir}"/PolarCursorTheme-Green/cursors \
		"${pkgdir}"/usr/share/icons/Polar-Green
	sed s/PolarCursorTheme/Polar/ -i "${srcdir}"/PolarCursorTheme-Green/index.theme
	install -Dm644 "${srcdir}"/PolarCursorTheme-Green/index.theme \
		"${pkgdir}"/usr/share/icons/Polar-Green/index.theme

	cp -R "${srcdir}"/PolarCursorTheme-Blue/cursors \
		"${pkgdir}"/usr/share/icons/Polar-Blue
	sed s/PolarCursorTheme/Polar/ -i "${srcdir}"/PolarCursorTheme-Blue/index.theme
	install -Dm644 "${srcdir}"/PolarCursorTheme-Blue/index.theme \
		"${pkgdir}"/usr/share/icons/Polar-Blue/index.theme
}
